import 'package:equatable/equatable.dart';
import 'package:tax_collect/feature/ticket/data/models/vehicule_type_model.dart';

class VehiculeTypeEntity extends Equatable {
  final int? id;
  final String? type;
  final double? price;

  const VehiculeTypeEntity({
    this.id,
    this.type,
    this.price,
  });

  VehiculeTypeModel toModel() => VehiculeTypeModel(
        id: id,
        type: type,
        price: price,
      );

  @override
  List<Object?> get props => [
        id,
        type,
        price,
      ];
}
