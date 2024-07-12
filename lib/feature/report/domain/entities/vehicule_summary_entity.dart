import 'package:equatable/equatable.dart';
import 'package:tax_collect/feature/report/data/models/vehicule_summary_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/vehicule_type_entity.dart';

class VehiculeSummaryEntity extends Equatable {
  final double total;
  final int count;
  final VehiculeTypeEntity? vehiculeTypeEntity;

  const VehiculeSummaryEntity({
    this.total = 0.0,
    this.count = 0,
    this.vehiculeTypeEntity,
  });

  VehiculeSummaryModel toModel() => VehiculeSummaryModel(
        total: total,
        count: count,
        vehiculeTypeEntity: vehiculeTypeEntity?.toModel(),
      );

  @override
  List<Object?> get props => [
        total,
        count,
        vehiculeTypeEntity,
      ];
}
