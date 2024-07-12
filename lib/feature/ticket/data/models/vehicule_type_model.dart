import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tax_collect/feature/ticket/domain/entities/vehicule_type_entity.dart';

part 'vehicule_type_model.g.dart';

@CopyWith()
@JsonSerializable(ignoreUnannotated: false)
class VehiculeTypeModel extends VehiculeTypeEntity {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'price')
  final double? price;

  const VehiculeTypeModel({
    this.id,
    this.type,
    this.price,
  });

  factory VehiculeTypeModel.fromJson(Map<String, dynamic> json) =>
      _$VehiculeTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehiculeTypeModelToJson(this);
}
