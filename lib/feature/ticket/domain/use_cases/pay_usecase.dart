import 'package:tax_collect/core/usecase/usecase_future.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_responce.dart';
import 'package:tax_collect/feature/ticket/domain/repositories/payment_repository.dart';

class PayUsecase extends UseCase<PaymentResponce?, Map<String, dynamic>> {
  PayUsecase({required this.repository});

  final PaymentRepository repository;

  @override
  Future<PaymentResponce?> call(Map<String, dynamic>? params) async =>
      // TODO: implement call
      repository.pay(queryParameters: params);
}
