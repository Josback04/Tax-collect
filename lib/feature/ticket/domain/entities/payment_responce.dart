import 'package:equatable/equatable.dart';
import 'package:tax_collect/feature/ticket/data/models/data_model.dart';

class PaymentResponce extends Equatable {
  const PaymentResponce({
    required this.success,
    required this.data,
  });
  final bool? success;
  final DataModel? data;

  @override
  List<Object?> get props => [
        success,
        data,
      ];
}
