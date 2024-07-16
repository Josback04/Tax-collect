import 'package:dio/dio.dart';
import 'package:tax_collect/feature/ticket/data/models/payment_responce_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_responce.dart';
import 'package:tax_collect/feature/ticket/domain/repositories/payment_repository.dart';

class PaymentSource extends PaymentRepository {
  PaymentSource({required this.dio});

  final Dio dio;

  @override
  Future<PaymentResponceModel?> pay(
      {Map<String, dynamic>? queryParameters}) async {
    final result = await dio.post<Map<String, dynamic>>(
      '/transactions',
      queryParameters: queryParameters,
    );
    return PaymentResponceModel.fromJson(result.data ?? {});
  }

  @override
  Future<PaymentResponce?> get({Map<String, dynamic>? queryParameters}) async {
    // TODO: implement get
    final result = await dio.get<Map<String, dynamic>>(
      '/transactions/check',
      queryParameters: queryParameters,
    );
    return PaymentResponceModel.fromJson(result.data ?? {});
  }
}
