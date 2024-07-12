part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class ConnectPrinterDeviceEvent extends SettingsEvent {
  const ConnectPrinterDeviceEvent({required this.printerDeviceModel});

  final PrinterDeviceModel printerDeviceModel;

  @override
  List<Object> get props => [printerDeviceModel];
}

class DisconnectPrinterDeviceEvent extends SettingsEvent {
  final PrinterDeviceModel printerDeviceModel;

  const DisconnectPrinterDeviceEvent({required this.printerDeviceModel});

  @override
  List<Object> get props => [printerDeviceModel];
}

class ClearScanDeviceEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class ScanDeviceEvent extends SettingsEvent {
  final PrinterType selectedPrinterType;
  final bool? ble;

  const ScanDeviceEvent({required this.selectedPrinterType, this.ble});

  @override
  List<Object?> get props => [selectedPrinterType, ble];
}

class ConfigPrinterDeviceOptionEvent extends SettingsEvent {
  final PrinterType? printerType;
  final PaperSize? paperSize;
  final bool? ble;
  final bool? reconnect;
  final String? ipAddress;
  final String? port;

  const ConfigPrinterDeviceOptionEvent({
    required this.printerType,
    required this.paperSize,
    this.reconnect,
    this.ble,
    this.ipAddress,
    this.port,
  });

  @override
  List<Object?> get props => [
        printerType,
        paperSize,
        reconnect,
        ble,
        ipAddress,
        port,
      ];
}

class GetPrinterDevicesStatusEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class PendingPrinterTaskEvent extends SettingsEvent {
  final List<int>? pendingTask;

  const PendingPrinterTaskEvent({
    this.pendingTask,
  });

  @override
  List<Object?> get props => [
        pendingTask,
      ];
}

class PrintEscPosEvent extends SettingsEvent {
  final Generator generator;
  final List<int> bytes;

  const PrintEscPosEvent({
    required this.generator,
    required this.bytes,
  });

  @override
  List<Object?> get props => [
        generator,
        bytes,
      ];
}

class PrintTestDataEvent extends SettingsEvent {
  final List<String> textToPrint;
  final PaperSize paperSize;

  const PrintTestDataEvent({
    required this.textToPrint,
    required this.paperSize,
  });

  @override
  List<Object?> get props => [
        textToPrint,
        paperSize,
      ];
}

class PutSelectedPrinterSavedEvent extends SettingsEvent {
  final PaperSize? paperSize;
  final PrinterDeviceModel? printerDeviceModel;
  final bool? reconnect;

  const PutSelectedPrinterSavedEvent({
    this.paperSize,
    this.printerDeviceModel,
    this.reconnect,
  });

  @override
  List<Object?> get props => [
        printerDeviceModel,
        paperSize,
        reconnect,
      ];
}

class GetSelectedPrinterSavedEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class ShowOptions extends SettingsEvent {
  final bool show;

  const ShowOptions({required this.show});

  @override
  List<Object?> get props => [
        show,
      ];
}
