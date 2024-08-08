part of 'payment_bloc.dart';

@CopyWith()
class PaymentState extends Equatable {
  final BlocState blocState;
  final BlocState paymentState;
  final int progress;
  final TimerStatus timerState;
  final String? message;

  const PaymentState({
    this.blocState = BlocState.initial,
    this.paymentState = BlocState.initial,
    this.progress = 0,
    this.message,
    this.timerState = TimerStatus.initial,
  });

  PaymentState copyWith(
          {BlocState? paymentState,
          TimerStatus? timerState,
          int? progress,
          String? message}) =>
      PaymentState(
        paymentState: paymentState ?? this.paymentState,
        timerState: timerState ?? this.timerState,
        progress: progress ?? this.progress,
        message: message ?? this.message,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        paymentState,
        timerState,
        progress,
        message,
      ];
}
