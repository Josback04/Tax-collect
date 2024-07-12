import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tax_collect/feature/ticket/data/models/vehicule_type_model.dart';

import '../../domain/entities/vehicule_summary_entity.dart';

part 'vehicule_summary_model.g.dart';

@CopyWith()
@JsonSerializable(ignoreUnannotated: false)
class VehiculeSummaryModel extends VehiculeSummaryEntity {
  @override
  final double total;

  @JsonKey(fromJson: _vehiculeTypeFromJson, toJson: _vehiculeTypeToJson)
  @override
  final VehiculeTypeModel? vehiculeTypeEntity;

  @override
  final int count;

  const VehiculeSummaryModel({
    this.total = 0.0,
    this.vehiculeTypeEntity,
    this.count = 0,
  });

  static VehiculeTypeModel? _vehiculeTypeFromJson(Map<String, dynamic>? json) =>
      json == null ? null : VehiculeTypeModel.fromJson(json);

  static Map<String, dynamic>? _vehiculeTypeToJson(
          VehiculeTypeModel? vehiculeType) =>
      vehiculeType?.toJson();

  factory VehiculeSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$VehiculeSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehiculeSummaryModelToJson(this);
}
