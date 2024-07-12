import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tax_collect/feature/ticket/data/models/vehicule_type_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

part 'payment_model.g.dart';

@CopyWith()
@JsonSerializable(ignoreUnannotated: false)
class PaymentModel extends PaymentEntity {
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'plate_number')
  final String? plateNumber;
  @override
  @JsonKey(name: 'method')
  final String? method;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'vehicule_type')
  final int? vehiculeType;

  @override
  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(fromJson: _vehiculeTypeFromJson, toJson: _vehiculeTypeToJson)
  @override
  final VehiculeTypeModel? vehiculeTypeEntity;

  const PaymentModel(
      {this.createdAt,
      this.id,
      this.plateNumber,
      this.method,
      this.amount,
      this.reference,
      this.vehiculeType,
      this.vehiculeTypeEntity});

  static VehiculeTypeModel? _vehiculeTypeFromJson(Map<String, dynamic>? json) =>
      json == null ? null : VehiculeTypeModel.fromJson(json);

  static Map<String, dynamic>? _vehiculeTypeToJson(
          VehiculeTypeModel? vehiculeType) =>
      vehiculeType?.toJson();

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
