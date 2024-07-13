import 'package:tax_collect/feature/ticket/domain/entities/payment_responce.dart';

abstract class PaymentRepository {
  Future<PaymentResponce?> get({Map<String, dynamic>? queryParameters});

  Future<PaymentResponce?> pay({Map<String, dynamic>? queryParameters});
}
