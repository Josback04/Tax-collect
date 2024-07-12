import 'package:equatable/equatable.dart';
import 'package:tax_collect/feature/ticket/data/models/payment_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/vehicule_type_entity.dart';

class PaymentEntity extends Equatable {
  final DateTime? createdAt;
  final int? id;
  final String? plateNumber;
  final int? vehiculeType;
  final double? amount;
  final String? reference;
  final String? method;
  final VehiculeTypeEntity? vehiculeTypeEntity;

  const PaymentEntity({
    this.createdAt,
    this.id,
    this.plateNumber,
    this.vehiculeType,
    this.method,
    this.amount,
    this.reference,
    this.vehiculeTypeEntity,
  });

  PaymentModel toModel() => PaymentModel(
        createdAt: createdAt,
        id: id,
        plateNumber: plateNumber,
        vehiculeType: vehiculeType,
        method: method,
        amount: amount,
        reference: reference,
        vehiculeTypeEntity: vehiculeTypeEntity?.toModel(),
      );

  @override
  List<Object?> get props => [
        createdAt,
        id,
        plateNumber,
        vehiculeType,
        method,
        amount,
        reference,
        vehiculeTypeEntity,
      ];
}
