import 'package:tax_collect/core/models/no_param.dart';
import 'package:tax_collect/core/usecase/usecase_future.dart';
import 'package:tax_collect/feature/history/domain/repositories/history_repository.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

class GetPaymentList implements UseCase<List<PaymentEntity>, NoParams> {
  final HistoryRepository repository;

  GetPaymentList(this.repository);

  @override
  Future<List<PaymentEntity>> call(NoParams params) {
    return repository.getPaymentList();
  }
}
