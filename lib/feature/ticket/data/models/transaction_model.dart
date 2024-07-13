import 'package:tax_collect/feature/ticket/domain/entities/transaction.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
@CopyWith()
class TransactionModel extends Transaction {
  const TransactionModel(
      {required this.reference,
      required this.amount,
      required this.amountCustomer,
      required this.currency,
      required this.createdAt,
      required this.status,
      required this.channel})
      : super(
            reference: reference,
            amount: amount,
            amountCustomer: amountCustomer,
            currency: currency,
            createdAt: createdAt,
            status: status,
            channel: channel);

  //create a transaction from Json Map

  factory TransactionModel.fromJson(Map<String, dynamic> data) =>
      _$TransactionModelFromJson(data);

  @override
  @JsonKey(name: 'reference')
  final String? reference;

  @override
  @JsonKey(name: 'amount')
  final String? amount;
  @override
  @JsonKey(name: 'amountCustomer')
  final String? amountCustomer;

  @override
  @JsonKey(name: 'currency')
  final String? currency;

  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  @JsonKey(name: 'channel')
  final String? channel;

  TransactionModel copyWith({
    String? reference,
    String? amount,
    String? amountCustomer,
    String? currency,
    String? createdAt,
    String? status,
    String? channel,
  }) {
    return TransactionModel(
      reference: reference ?? this.reference,
      amount: amount ?? this.amount,
      amountCustomer: amountCustomer ?? this.amountCustomer,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      channel: channel ?? this.channel,
    );
  }

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

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
