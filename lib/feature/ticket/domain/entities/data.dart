import 'package:equatable/equatable.dart';
import 'package:tax_collect/feature/ticket/data/models/transaction_model.dart';

class Data extends Equatable {
  const Data({
    required this.code,
    required this.message,
    required this.orderNumber,
    required this.transaction,
  });
  final String? code;
  final String? message;
  final String? orderNumber;
  final TransactionModel? transaction;

  @override
  List<Object?> get props => [
        code,
        message,
        orderNumber,
        transaction,
      ];
}
