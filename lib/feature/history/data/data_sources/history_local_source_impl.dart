import 'package:drift/drift.dart';
import 'package:tax_collect/core/data/database/app_database.dart';
import 'package:tax_collect/feature/history/data/data_sources/history_local_source.dart';
import 'package:tax_collect/feature/ticket/data/models/payment_model.dart';
import 'package:tax_collect/feature/ticket/data/models/vehicule_type_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

const _serializer =
    ValueSerializer.defaults(serializeDateTimeValuesAsString: true);

class HistoryLocalSourceImpl extends HistoryLocalSource {
  final AppDatabase _database;

  HistoryLocalSourceImpl({
    required AppDatabase database,
  }) : _database = database;

  @override
  Future<List<PaymentEntity>> getPaymentList() async {
    var tablePayment = _database.paymentTable;

    var query = tablePayment.select().join(
      [
        leftOuterJoin(
          _database.vehiculeTypeTable,
          _database.vehiculeTypeTable.id.equalsExp(
            _database.paymentTable.vehiculeType,
          ),
        )
      ],
    );

    query.orderBy([
      OrderingTerm(expression: tablePayment.createdAt, mode: OrderingMode.desc)
    ]);

    var result = (await query.get());

    var list = result.map((e) {
      final paymentData = e.readTable(_database.paymentTable);
      final vehiculeData = e.readTableOrNull(_database.vehiculeTypeTable);

      final vehiculeTypeModel = vehiculeData != null
          ? VehiculeTypeModel.fromJson(
              vehiculeData.toJson(serializer: _serializer))
          : null;

      return PaymentModel.fromJson(paymentData.toJson(serializer: _serializer))
          .copyWith(
        id: paymentData.idLocal,
        createdAt: paymentData.createdAt,
        plateNumber: paymentData.plateNumber,
        vehiculeType: vehiculeTypeModel?.id,
        amount: paymentData.amount,
        reference: paymentData.reference,
        method: paymentData.method?.name,
        vehiculeTypeEntity: vehiculeTypeModel,
      );
    }).toList();

    return list;
  }
}
