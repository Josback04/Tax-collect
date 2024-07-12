import 'package:hive/hive.dart';
import 'package:tax_collect/feature/settings/data/models/printer_device_model.dart';
import 'package:thermal_printer/thermal_printer.dart';

part 'printer_hive_box.g.dart';

@HiveType(typeId: 1)
class PrinterHiveBox {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? deviceName;
  @HiveField(2)
  String? address;
  @HiveField(3)
  String? port;
  @HiveField(4)
  String? vendorId;
  @HiveField(5)
  String? productId;

  ///isBle: Bluetooth Low energy commonly used in ios.
  @HiveField(6)
  bool? isBle;
  @HiveField(7)
  bool? state;
  @HiveField(8)
  int? paperSize;
  @HiveField(9)
  bool? reconnect;

  //Please convert to printerType when retrieving from hive
  @HiveField(10)
  String? printerType;

  PrinterHiveBox({
    this.id,
    this.deviceName,
    this.address,
    this.port,
    this.vendorId,
    this.productId,
    this.isBle,
    this.state,
    this.paperSize,
    this.reconnect,
    this.printerType,
  });

  PrinterDeviceModel toPrinterDeviceModel() => PrinterDeviceModel(
        id: id,
        deviceName: deviceName,
        address: address,
        port: port,
        vendorId: vendorId,
        productId: productId,
        isBle: isBle,
        state: state,
        typePrinter: printerType == PrinterType.usb.name
            ? PrinterType.usb
            : printerType == PrinterType.bluetooth.name
                ? PrinterType.bluetooth
                : PrinterType.network,
      );
}
