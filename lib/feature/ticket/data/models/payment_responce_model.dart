import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tax_collect/feature/ticket/data/models/data_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_responce.dart';

part 'payment_responce_model.g.dart';

/// {@template payment_responce_model}
/// PaymentResponceModel description
/// {@endtemplate}
@JsonSerializable()
@CopyWith()
class PaymentResponceModel extends PaymentResponce {
  const PaymentResponceModel({
    required this.data,
    required this.success,
  }) : super(success: success, data: data);

  //creates a method fromJson from PaymentRespinceModel
  factory PaymentResponceModel.fromJson(Map<String, dynamic> data) =>
      _$PaymentResponceModelFromJson(data);

  @override
  @JsonKey(name: 'success')
  final bool? success;

  @override
  @JsonKey(name: 'data')
  final DataModel? data;

  PaymentResponceModel copyWith({
    bool? success,
    DataModel? data,
  }) {
    return PaymentResponceModel(
        success: success ?? this.success, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        success,
        data,
      ];

  //vreate a json map from a paymentrespinceModel
  Map<String, dynamic> toJSon() => _$PaymentResponceModelToJson(this);
}
