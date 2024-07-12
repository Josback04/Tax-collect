part of 'ticket_bloc.dart';

@CopyWith()
class TicketState extends Equatable {
  final VehiculeTypeEntity? selectedVehiculeTypeEntity;

  final String? plateNumber;

  final String? phoneNumber;
  final String? message;

  final PaymentEntity? paymentEntityResult;
  final BlocState blocState;

  const TicketState({
    this.blocState = BlocState.initial,
    this.plateNumber,
    this.message,
    this.phoneNumber,
    this.paymentEntityResult,
    this.selectedVehiculeTypeEntity,
  });

  @override
  List<Object?> get props => [
        selectedVehiculeTypeEntity,
        plateNumber,
        phoneNumber,
        blocState,
        paymentEntityResult,
        message,
      ];
}
