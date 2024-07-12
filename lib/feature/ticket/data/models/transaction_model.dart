import 'package:tax_collect/feature/ticket/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel(
      {required super.reference,
      required super.amount,
      required super.amountCustomer,
      required super.currency,
      required super.createdAt,
      required super.status,
      required super.channel});

  //create a transaction from Json Map
}
