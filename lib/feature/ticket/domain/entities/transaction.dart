import 'package:equatable/equatable.dart';

/// {@template transaction}
/// Transaction description
/// {@endtemplate}
class Transaction extends Equatable {
  /// {@macro transaction}
  const Transaction({
    required this.reference,
    required this.amount,
    required this.amountCustomer,
    required this.currency,
    required this.createdAt,
    required this.status,
    required this.channel,
  });

  final String? reference;
  final String? amount;
  final String? amountCustomer;
  final String? currency;
  final String? createdAt;
  final String? status;
  final String? channel;

  @override
  List<Object?> get props => [
        reference,
        amount,
        amountCustomer,
        currency,
        createdAt,
        status,
        channel,
      ];
}
