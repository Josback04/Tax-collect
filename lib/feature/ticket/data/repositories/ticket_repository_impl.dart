import 'package:tax_collect/feature/ticket/data/data_sources/ticket_local_source.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';
import 'package:tax_collect/feature/ticket/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl extends TicketRepository {
  final TicketLocalSource _localSource;

  TicketRepositoryImpl({
    required TicketLocalSource localSource,
  }) : _localSource = localSource;

  @override
  Future<PaymentEntity?> savePayment(PaymentEntity payment) async {
    return await _localSource.savePayment(payment);
  }
}
