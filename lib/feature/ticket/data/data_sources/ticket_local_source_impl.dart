import 'package:drift/drift.dart';
import 'package:tax_collect/core/data/database/app_database.dart';
import 'package:tax_collect/core/data/database/table/payment_table.dart';
import 'package:tax_collect/feature/ticket/data/data_sources/ticket_local_source.dart';
import 'package:tax_collect/feature/ticket/data/models/payment_model.dart';
import 'package:tax_collect/feature/ticket/data/models/vehicule_type_model.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

import '../../../../core/utils/constants.dart';

const _serializer =
    ValueSerializer.defaults(serializeDateTimeValuesAsString: true);

class TicketLocalSourceImpl extends TicketLocalSource {
  final AppDatabase _database;

  TicketLocalSourceImpl({
    required AppDatabase database,
  }) : _database = database;

  @override
  Future<PaymentEntity?> savePayment(PaymentEntity payment) async {
    final tableVehicule = _database.vehiculeTypeTable;
    var tablePayment = _database.paymentTable;

    final companionPayment = PaymentTableCompanion.insert(
      createdAt: Value(payment.createdAt),
      plateNumber: Value(payment.plateNumber),
      method: Value(getMethod(payment.method)),
      amount: Value(payment.amount),
      reference: Value(payment.reference),
      vehiculeType: Value(payment.vehiculeType),
    );

    if (payment.vehiculeTypeEntity != null) {
      final companionVehicule = VehiculeTypeTableCompanion.insert(
        id: Value(payment.vehiculeTypeEntity?.id),
        type: Value(payment.vehiculeTypeEntity?.type),
        price: Value(payment.vehiculeTypeEntity?.price),
      );

      var vehiculeId = await _database.into(tableVehicule).insert(
            companionVehicule,
            onConflict: DoUpdate(
              (update) => companionVehicule,
              target: [
                tableVehicule.id,
              ],
            ),
          );
    }

    var idLocal = await _database.into(tablePayment).insert(
          companionPayment,
          onConflict: DoUpdate(
            (old) => companionPayment,
          ),
        );

    var query = tablePayment.select().join(
      [
        leftOuterJoin(
          _database.vehiculeTypeTable,
          _database.vehiculeTypeTable.id.equalsExp(
            _database.paymentTable.vehiculeType,
          ),
        )
      ],
    )..where(
        _database.paymentTable.idLocal.equals(idLocal),
      );

    var result = (await query.getSingleOrNull());

    final paymentData = result?.readTableOrNull(_database.paymentTable);
    final vehiculeData = result?.readTableOrNull(_database.vehiculeTypeTable);

    final vehiculeTypeModel = vehiculeData != null
        ? VehiculeTypeModel.fromJson(
            vehiculeData.toJson(serializer: _serializer))
        : null;

    PaymentEntity? paymentEntity;
    if (paymentData != null) {
      paymentEntity =
          PaymentModel.fromJson(paymentData.toJson(serializer: _serializer))
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
    }

    return paymentEntity;
  }
}
