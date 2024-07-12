part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object?> get props => [];
}

class InitReportEvent extends ReportEvent {
  final List<PaymentEntity>? paymentList;
  final DateTime? dateTime;

  const InitReportEvent({
    this.paymentList = const [],
    this.dateTime,
  });

  @override
  List<Object?> get props => [
        paymentList,
        dateTime,
      ];
}
