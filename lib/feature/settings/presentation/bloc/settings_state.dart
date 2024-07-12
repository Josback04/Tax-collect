part of 'settings_bloc.dart';

@CopyWith()
class SettingsState extends Equatable {
  final PrinterDeviceModel? selectedPrinterDevice;
  final List<PrinterDeviceModel> printerDeviceModelList;
  final String? message;
  final String? port;
  final String? ipAddress;
  final bool? ble;
  final bool? reconnect;
  final PaperSize? paperSize;
  final PrinterType? printerType;
  final bool? isConnected;
  final BTStatus btStatus;
  final USBStatus usbStatus;
  final TCPStatus tcpStatus;
  final List<int>? pendingPrinterTask;

  final bool showOption;

  const SettingsState({
    this.selectedPrinterDevice,
    this.printerDeviceModelList = const [],
    this.message,
    this.port,
    this.ipAddress,
    this.ble,
    this.reconnect,
    this.paperSize,
    this.printerType,
    this.isConnected,
    this.btStatus = BTStatus.none,
    this.usbStatus = USBStatus.none,
    this.tcpStatus = TCPStatus.none,
    this.pendingPrinterTask,
    this.showOption = false,
  });

  @override
  List<Object?> get props => [
        selectedPrinterDevice,
        printerDeviceModelList,
        message,
        port,
        ipAddress,
        ble,
        reconnect,
        paperSize,
        printerType,
        isConnected,
        btStatus,
        usbStatus,
        tcpStatus,
        pendingPrinterTask,
        showOption,
      ];
}
