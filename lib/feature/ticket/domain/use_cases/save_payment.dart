import 'package:tax_collect/core/usecase/usecase_future.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';
import 'package:tax_collect/feature/ticket/domain/repositories/ticket_repository.dart';

class SavePayment implements UseCase<PaymentEntity?, PaymentEntity> {
  final TicketRepository repository;

  const SavePayment(this.repository);

  @override
  Future<PaymentEntity?> call(PaymentEntity params) async {
    return await repository.savePayment(params);
  }
}
