import 'package:drift/drift.dart';
import 'package:tax_collect/core/data/database/app_database.dart';
import 'package:tax_collect/feature/history/domain/repositories/history_repository.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

import '../../../ticket/data/models/vehicule_type_model.dart';
import '../data_sources/history_local_source.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryLocalSource localSource;

  HistoryRepositoryImpl({required this.localSource});

  @override
  Future<List<PaymentEntity>> getPaymentList() {
    return localSource.getPaymentList();
  }
}
