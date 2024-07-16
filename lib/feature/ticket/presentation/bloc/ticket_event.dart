part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object?> get props => [];
}

class InitTicketEvent extends TicketEvent {
  const InitTicketEvent();

  @override
  List<Object?> get props => [];
}

class MakePaymentEvent extends TicketEvent {
  final VehiculeTypeEntity? vehiculeTypeEntity;
  final String? plaqueNumber;
  final Method? method;
  final String? reference;

  const MakePaymentEvent({
    this.vehiculeTypeEntity,
    this.plaqueNumber,
    this.method,
    this.reference,
  });

  @override
  List<Object?> get props => [
        vehiculeTypeEntity,
        plaqueNumber,
        method,
        reference,
      ];
}

class SelectVehiculeEvent extends TicketEvent {
  final VehiculeTypeEntity? vehiculeTypeEntity;

  const SelectVehiculeEvent({this.vehiculeTypeEntity});

  @override
  List<Object?> get props => [
        vehiculeTypeEntity,
      ];
}

class EnterPlateNumberEvent extends TicketEvent {
  final String? plate;

  const EnterPlateNumberEvent({this.plate});

  @override
  List<Object?> get props => [
        plate,
      ];
}

class EnterPhoneNumberEvent extends TicketEvent {
  final String? phoneNumber;

  const EnterPhoneNumberEvent({this.phoneNumber});

  @override
  List<Object?> get props => [
        phoneNumber,
      ];
}

class PaymentEvent extends TicketEvent {
  const PaymentEvent({required this.montant, required this.phone});
  final String phone;
  final double? montant;

  @override
  // TODO: implement props
  List<Object?> get props => [
        phone,
        montant,
      ];
}
