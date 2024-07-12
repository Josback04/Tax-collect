import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

abstract class TicketLocalSource {
  Future<PaymentEntity?> savePayment(PaymentEntity payment);
}
