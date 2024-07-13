import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tax_collect/feature/ticket/data/models/transaction_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/data.dart';

part 'data_model.g.dart';

@JsonSerializable()
@CopyWith()
class DataModel extends Data {
  const DataModel({
    required this.code,
    required this.message,
    required this.orderNumber,
    required this.transaction,
  }) : super(
          code: code,
          message: message,
          orderNumber: orderNumber,
          transaction: transaction,
        );

  factory DataModel.fromJson(Map<String, dynamic> data) =>
      _$DataModelFromJson(data);

  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'orderNumber')
  final String? orderNumber;
  @override
  @JsonKey(name: 'transaction')
  final TransactionModel? transaction;

  /// Creates a copy of the current Data with property changes
  DataModel copyWith({
    String? code,
    String? message,
    String? orderNumber,
    TransactionModel? transaction,
  }) {
    return DataModel(
      code: code ?? this.code,
      message: message ?? this.message,
      orderNumber: orderNumber ?? this.orderNumber,
      transaction: transaction ?? this.transaction,
    );
  }

  @override
  List<Object?> get props => [
        code,
        message,
        orderNumber,
        transaction,
      ];

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
