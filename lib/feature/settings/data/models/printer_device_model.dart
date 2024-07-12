import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:thermal_printer/thermal_printer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'printer_device_model.g.dart';

@JsonSerializable()
@CopyWith()
class PrinterDeviceModel extends Equatable {
  final int? id;
  final String? deviceName;
  final String? address;
  final String? port;
  final String? vendorId;
  final String? productId;

  ///isBle: Bluetooth Low energy commonly used in ios.
  final bool? isBle;
  final bool? state;
  final PrinterType typePrinter;

  const PrinterDeviceModel({
    this.id,
    this.deviceName,
    this.address,
    this.port,
    this.vendorId,
    this.productId,
    this.isBle,
    this.state,
    this.typePrinter = PrinterType.bluetooth,
  });

  factory PrinterDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$PrinterDeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrinterDeviceModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        deviceName,
        address,
        port,
        vendorId,
        productId,
        isBle,
        state,
        typePrinter,
      ];
}
