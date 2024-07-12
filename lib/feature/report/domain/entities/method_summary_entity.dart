import 'package:equatable/equatable.dart';
import 'package:tax_collect/feature/report/data/models/method_summary_model.dart';

class MethodSummaryEntity extends Equatable {
  final String? method;
  final double total;
  final int count;

  const MethodSummaryEntity({
    this.method,
    this.total = 0.0,
    this.count = 0,
  });

  MethodSummaryModel toModel() => MethodSummaryModel(
        method: method,
        total: total,
        count: count,
      );

  @override
  List<Object?> get props => [
        method,
        total,
        count,
      ];
}
