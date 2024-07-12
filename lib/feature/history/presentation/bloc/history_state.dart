part of 'history_bloc.dart';

@CopyWith()
class HistoryState extends Equatable {
  final String? message;
  final List<PaymentEntity>? paymentList;

  final BlocState blocState;

  const HistoryState({
    this.message,
    this.paymentList,
    this.blocState = BlocState.initial,
  });

  @override
  List<Object?> get props => [
        message,
        paymentList,
        blocState,
      ];
}
