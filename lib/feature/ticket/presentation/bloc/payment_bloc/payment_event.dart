part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DoPaymentEvent extends PaymentEvent {
  const DoPaymentEvent({required this.amount, required this.phone});
  final String phone;
  final double amount;
  @override
  // TODO: implement props
  List<Object?> get props => [
        phone,
        amount,
      ];
}

class TimerProgress extends PaymentEvent {
  const TimerProgress({required this.value});

  final int value;

  @override
  List<Object> get props => [value];
}

class ResetTimer extends PaymentEvent {}

class PendingOrderEvent extends PaymentEvent {
  const PendingOrderEvent(this.order);

  final String order;

  @override
  List<Object> get props => [order];
}
