part of 'ticket_bloc.dart';

@CopyWith()
class TicketState extends Equatable {
  final VehiculeTypeEntity? selectedVehiculeTypeEntity;

  final String? plateNumber;

  final String? phoneNumber;
  final String? message;

  final PaymentEntity? paymentEntityResult;
  final BlocState blocState;
  final BlocState paymentState;
  final int? statusCode;

  const TicketState({
    this.blocState = BlocState.initial,
    this.paymentState = BlocState.initial,
    this.plateNumber,
    this.message,
    this.phoneNumber,
    this.paymentEntityResult,
    this.selectedVehiculeTypeEntity,
    this.statusCode,
  });

  @override
  List<Object?> get props => [
        paymentState,
        selectedVehiculeTypeEntity,
        plateNumber,
        phoneNumber,
        blocState,
        paymentEntityResult,
        message,
        statusCode,
      ];
}
