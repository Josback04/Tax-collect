import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

abstract class HistoryLocalSource {
  Future<List<PaymentEntity>> getPaymentList();
}
