import 'package:tax_collect/feature/ticket/data/data_sources/payment_source.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_responce.dart';
import 'package:tax_collect/feature/ticket/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  PaymentRepositoryImpl({required this.source});

  final PaymentSource source;

  @override
  Future<PaymentResponce?> get({Map<String, dynamic>? queryParameters}) async {
    // TODO: implement get
    return source.pay(queryParameters: queryParameters);
  }

  @override
  Future<PaymentResponce?> pay({Map<String, dynamic>? queryParameters}) {
    // TODO: implement pay
    return source.pay(queryParameters: queryParameters);
  }
}
