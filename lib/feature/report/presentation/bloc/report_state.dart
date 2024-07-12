part of 'report_bloc.dart';

@CopyWith()
class ReportState extends Equatable {
  final List<PaymentEntity> paymentList;

  final List<VehiculeSummaryEntity> vehiculeSummaryList;

  final List<MethodSummaryEntity> methodSummaryList;

  final double totalAmount;

  final DateTime? dateTime;

  const ReportState({
    this.paymentList = const [],
    this.vehiculeSummaryList = const [],
    this.totalAmount = 0.0,
    this.dateTime,
    this.methodSummaryList = const [],
  });

  @override
  List<Object?> get props => [
        paymentList,
        vehiculeSummaryList,
        totalAmount,
        dateTime,
        methodSummaryList,
      ];
}
