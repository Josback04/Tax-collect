import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/error_handler.dart';
import 'package:tax_collect/core/utils/image_utils.dart';
import 'package:tax_collect/core/utils/util.dart';
import 'package:tax_collect/feature/settings/data/models/printer_hive_box.dart';
import 'package:tax_collect/generated/assets.gen.dart';
import 'package:thermal_printer/esc_pos_utils_platform/esc_pos_utils_platform.dart';
import 'package:thermal_printer/thermal_printer.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:image/image.dart' as img;

import '../../data/models/printer_device_model.dart';

part 'settings_event.dart';

part 'settings_state.dart';

part 'settings_bloc.g.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<ScanDeviceEvent>(_onScanDeviceEvent);
    on<ClearScanDeviceEvent>(_onClearScanDeviceEvent);
    on<ConnectPrinterDeviceEvent>(_onConnectDevicePrinterEvent);
    on<DisconnectPrinterDeviceEvent>(_onDisconnectDevicePrinterEvent);
    on<ConfigPrinterDeviceOptionEvent>(_onConfigPrinterDeviceEvent);
    on<GetPrinterDevicesStatusEvent>(_onGetPrinterDeviceStatusEvent);
    on<PendingPrinterTaskEvent>(_onPendingPrinterTaskEvent);
    on<PrintEscPosEvent>(_onPrintEscPosEvent);
    on<PrintTestDataEvent>(_onPrintTestDataEvent);
    on<PutSelectedPrinterSavedEvent>(_onPutSelectedPrinterSavedEvent);
    on<GetSelectedPrinterSavedEvent>(_onGetSelectedPrinterSavedEvent);
    on<ShowOptions>(_onShowOptions);
  }

  FutureOr<void> _onConnectDevicePrinterEvent(
    ConnectPrinterDeviceEvent event,
    Emitter<SettingsState> emit,
  ) {
    final printerManager = GetIt.I<PrinterManager>();
    final newDevice = event.printerDeviceModel;

    ///Disconnect previous selected printer before connecting
    final previousPrinter = state.selectedPrinterDevice;
    if (previousPrinter != null) {
      if ((newDevice.address != previousPrinter.address) ||
          (newDevice.typePrinter == PrinterType.usb &&
              previousPrinter.vendorId != newDevice.vendorId)) {
        add(DisconnectPrinterDeviceEvent(printerDeviceModel: previousPrinter));
      }
    }

    ///Connect new device according to printer type
    var isConnected = state.isConnected;
    switch (newDevice.typePrinter) {
      case PrinterType.usb:
        printerManager.connect(
            type: newDevice.typePrinter,
            model: UsbPrinterInput(
              name: newDevice.deviceName,
              productId: newDevice.productId,
              vendorId: newDevice.vendorId,
            ));
        isConnected = true;
        break;
      case PrinterType.bluetooth:
        printerManager.connect(
            type: newDevice.typePrinter,
            model: BluetoothPrinterInput(
              name: newDevice.deviceName,
              address: newDevice.address ?? "",
              isBle: newDevice.isBle ?? false,
              autoConnect: state.reconnect ?? false,
            ));
        break;
      case PrinterType.network:
        printerManager.connect(
            type: newDevice.typePrinter,
            model: TcpPrinterInput(
              ipAddress: newDevice.address ?? "",
            ));
        isConnected = true;
        break;
      default:
    }

    ///Saving printer config in app memory
    add(PutSelectedPrinterSavedEvent(
      paperSize: state.paperSize,
      printerDeviceModel: event.printerDeviceModel,
      reconnect: state.reconnect,
    ));

    emit(
      state.copyWith(
        selectedPrinterDevice: event.printerDeviceModel,
        isConnected: isConnected,
      ),
    );
  }

  FutureOr<void> _onConfigPrinterDeviceEvent(
    ConfigPrinterDeviceOptionEvent event,
    Emitter<SettingsState> emit,
  ) {
    errorHandler(() async {
      add(GetPrinterDevicesStatusEvent());
    }).either(
        (left) => emit(
              state.copyWith(
                message: left.message,
              ),
            ),
        (right) => emit(state.copyWith(
              printerType: event.printerType,
              paperSize: event.paperSize,
              ble: event.ble ?? state.ble,
              reconnect: event.reconnect ?? state.reconnect,
              ipAddress: event.ipAddress ?? state.ipAddress,
              port: event.port ?? state.port,
            )));
  }

  FutureOr<void> _onScanDeviceEvent(
    ScanDeviceEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final printerManager = GetIt.I<PrinterManager>();
    add(ClearScanDeviceEvent());
    var stream = printerManager.discovery(
        type: event.selectedPrinterType, isBle: event.ble ?? false);

    await emit.forEach(
        printerManager.discovery(
            type: event.selectedPrinterType,
            isBle: event.ble ?? false), onData: (device) {
      final printerDeviceModelList = List.of(state.printerDeviceModelList);
      PrinterDeviceModel printerDeviceModel = PrinterDeviceModel(
        deviceName: device.name,
        address: device.address,
        isBle: event.ble ?? false,
        vendorId: device.vendorId,
        productId: device.productId,
        typePrinter: event.selectedPrinterType,
      );
      bool deviceAlreadyPresent =
          printerDeviceModelList.contains(printerDeviceModel);
      return state.copyWith(printerDeviceModelList: [
        ...state.printerDeviceModelList,
        if (!deviceAlreadyPresent) printerDeviceModel
      ]);
    });
  }

  FutureOr<void> _onClearScanDeviceEvent(
    ClearScanDeviceEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(printerDeviceModelList: []));
  }

  FutureOr<void> _onDisconnectDevicePrinterEvent(
      DisconnectPrinterDeviceEvent event, Emitter<SettingsState> emit) async {
    final printerManager = GetIt.I<PrinterManager>();
    final printerHiveBox = GetIt.I<Box<PrinterHiveBox>>();

    errorHandler(() async {
      return event.printerDeviceModel;
    }).either(
        (left) => emit(
              state.copyWith(
                message: left.message,
              ),
            ), (right) {
      final selectedPrinter = state.selectedPrinterDevice;
      if (selectedPrinter != null) {
        printerManager.disconnect(type: selectedPrinter.typePrinter);

        ///removing device from saved box
        printerHiveBox.delete(boxPrinterHiveKey);
        //logger.i(printerHiveBox.containsKey(boxPrinterHiveKey));
      }
      emit(
        state.copyWith(
          selectedPrinterDevice: null,
          isConnected: false,
        ),
      );
    });
  }

  FutureOr<void> _onGetPrinterDeviceStatusEvent(
    GetPrinterDevicesStatusEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final printerManager = GetIt.I<PrinterManager>();

    /// subscription to listen change status of bluetooth connection
    await emit.forEach(printerManager.stateBluetooth, onData: (status) {
      logger.i(' ----------------- status bt $status ------------------ ');
      bool? isConnected;
      if (status == BTStatus.connected) {
        isConnected = true;
      }
      if (status == BTStatus.none) {
        isConnected = false;
      }
      if (status == BTStatus.connected && state.pendingPrinterTask != null) {
        if (Platform.isAndroid) {
          Future.delayed(const Duration(seconds: 1), () {
            printerManager.send(
                type: PrinterType.bluetooth, bytes: state.pendingPrinterTask!);
            add(const PendingPrinterTaskEvent(pendingTask: null));
          });
        } else if (Platform.isIOS) {
          printerManager.send(
              type: PrinterType.bluetooth, bytes: state.pendingPrinterTask!);
          add(const PendingPrinterTaskEvent(pendingTask: null));
        }
      }
      return state.copyWith(isConnected: isConnected, btStatus: status);
    });

    ///  PrinterManager.instance.stateUSB is only supported on Android
    await emit.forEach(printerManager.stateUSB, onData: (status) {
      logger.i(' ----------------- status usb $status ------------------ ');
      if (Platform.isAndroid) {
        if (Platform.isAndroid) {
          if (status == USBStatus.connected &&
              state.pendingPrinterTask != null) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              PrinterManager.instance.send(
                  type: PrinterType.usb, bytes: state.pendingPrinterTask!);
              add(const PendingPrinterTaskEvent(pendingTask: null));
            });
          }
        }
      }
      return state.copyWith(usbStatus: status);
    });

    ///  PrinterManager.instance.stateUSB is only supported on Android
    await emit.forEach(printerManager.stateTCP, onData: (status) {
      logger.i(' ----------------- status tcp $status ------------------ ');
      return state.copyWith(tcpStatus: status);
    });
  }

  FutureOr<void> _onPendingPrinterTaskEvent(
    PendingPrinterTaskEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(pendingPrinterTask: event.pendingTask));
  }

  Future<FutureOr<void>> _onPrintEscPosEvent(
      PrintEscPosEvent event, Emitter<SettingsState> emit) async {
    final printerManager = GetIt.I<PrinterManager>();
    final device = state.selectedPrinterDevice;
    var bytes = event.bytes;
    final generator = event.generator;
    var connectedTCP = false;
    if (device == null) {
    } else {
      switch (device.typePrinter) {
        case PrinterType.usb:
          bytes += generator.feed(2);
          bytes += generator.cut();
          printerManager.connect(
              type: device.typePrinter,
              model: UsbPrinterInput(
                name: device.deviceName,
                productId: device.productId,
                vendorId: device.vendorId,
              ));
          add(const PendingPrinterTaskEvent(pendingTask: null));
          break;
        case PrinterType.bluetooth:
          bytes += generator.feed(1);
          bytes += generator.cut();
          printerManager.connect(
              type: device.typePrinter,
              model: BluetoothPrinterInput(
                  name: device.deviceName,
                  address: device.address!,
                  isBle: device.isBle ?? false,
                  autoConnect: state.reconnect ?? false));
          add(const PendingPrinterTaskEvent(pendingTask: null));
          if (Platform.isAndroid) {
            add(PendingPrinterTaskEvent(pendingTask: bytes));
          }
          break;

        case PrinterType.network:
          bytes += generator.feed(2);
          bytes += generator.cut();
          connectedTCP = await printerManager.connect(
              type: device.typePrinter,
              model: TcpPrinterInput(ipAddress: device.address!));
          if (!connectedTCP) {
            logger.e(' --- please review your TCP connection ---');
          }
        default:
      }
      if (device.typePrinter == PrinterType.bluetooth && Platform.isAndroid) {
        if (state.btStatus == BTStatus.connected) {
          printerManager.send(type: device.typePrinter, bytes: bytes);
          add(const PendingPrinterTaskEvent(pendingTask: null));
        }
      } else {
        printerManager.send(type: device.typePrinter, bytes: bytes);
      }
    }
  }

  FutureOr<void> _onPrintTestDataEvent(
    PrintTestDataEvent event,
    Emitter<SettingsState> emit,
  ) async {
    logger.t(event);
    final printerProfile = GetIt.I<CapabilityProfile>();
    List<int> bytes = [];
    final texts = event.textToPrint;
    final paperSize = event.paperSize;
    final generator = Generator(paperSize, printerProfile);

    ///Image test to print from Assets
    final ByteData data = await rootBundle.load(Assets.images.tax.path);
    if (data.lengthInBytes > 0) {
      final Uint8List imageBytes = data.buffer.asUint8List();
      // decode the bytes into an image
      final decodedImage = img.decodeImage(imageBytes)!;

      // Create a black bottom layer
      // Resize the image to a 130x? thumbnail (maintaining the aspect ratio).
      img.Image thumbnail = img.copyResize(decodedImage, height: 130);
      // creates a copy of the original image with set dimensions
      img.Image originalImg =
          img.copyResize(decodedImage, width: 380, height: 130);
      // fills the original image with a white background
      img.fill(originalImg, color: img.ColorRgb8(255, 255, 255));
      var padding = (originalImg.width - thumbnail.width) / 2;

      //insert the image inside the frame and center it
      drawImage(originalImg, thumbnail, dstX: padding.toInt());

      // convert image to grayscale
      var grayscaleImage = img.grayscale(originalImg);

      bytes += generator.feed(1);
      bytes += generator.imageRaster(grayscaleImage, align: PosAlign.center);
      bytes += generator.feed(2);
    }

    ///Text test to print
    for (var text in texts) {
      bytes += generator.text(text.replaceAllDiacritics());
    }
    bytes += generator.feed(1);

    add(PrintEscPosEvent(generator: generator, bytes: bytes));
  }

  FutureOr<void> _onPutSelectedPrinterSavedEvent(
    PutSelectedPrinterSavedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final printerHiveBox = GetIt.I<Box<PrinterHiveBox>>();
    var savedPrinter = PrinterHiveBox()
      ..id = event.printerDeviceModel?.id
      ..deviceName = event.printerDeviceModel?.deviceName
      ..address = event.printerDeviceModel?.address
      ..port = event.printerDeviceModel?.port
      ..vendorId = event.printerDeviceModel?.vendorId
      ..productId = event.printerDeviceModel?.productId
      ..isBle = event.printerDeviceModel?.isBle
      ..state = event.printerDeviceModel?.state
      ..paperSize = event.paperSize?.value
      ..reconnect = event.reconnect
      ..state = event.printerDeviceModel?.state
      ..printerType = event.printerDeviceModel?.typePrinter.name;

    printerHiveBox.put(boxPrinterHiveKey, savedPrinter);
    logger.i(printerHiveBox.containsKey(boxPrinterHiveKey));
  }

  FutureOr<void> _onGetSelectedPrinterSavedEvent(
    GetSelectedPrinterSavedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final printerHiveBox = GetIt.I<Box<PrinterHiveBox>>();
    var savedPrinter = printerHiveBox.get(boxPrinterHiveKey);
    logger.i(printerHiveBox.containsKey(boxPrinterHiveKey));

    PrinterDeviceModel? selectedPrinterDevice;

    if (savedPrinter != null) {
      selectedPrinterDevice = savedPrinter.toPrinterDeviceModel();
    }

    emit(state.copyWith(
      paperSize: savedPrinter?.paperSize == PaperSize.mm58.value
          ? PaperSize.mm58
          : PaperSize.mm80,
      selectedPrinterDevice: selectedPrinterDevice,
      reconnect: savedPrinter?.reconnect,
      printerType: selectedPrinterDevice?.typePrinter,
      port: savedPrinter?.port,
      ipAddress: savedPrinter?.printerType == PrinterType.network.name
          ? savedPrinter?.address
          : null,
      ble: savedPrinter?.isBle,
    ));
  }

  FutureOr<void> _onShowOptions(
    ShowOptions event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(
      showOption: event.show,
    ));
  }
}
