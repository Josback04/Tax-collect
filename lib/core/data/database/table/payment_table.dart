import 'package:drift/drift.dart';
import 'package:tax_collect/core/data/database/table/vehicule_type_table.dart';

enum Method { cash, mobile }

Method? getMethod(String? value) {
  Method? method;
  if (value == null) return null;
  for (var m in Method.values) {
    if (m.name.toLowerCase() == value.toLowerCase()) method = m;
  }
  return method;
}

@DataClassName('payment')
class PaymentTable extends Table {
  IntColumn get idLocal => integer().autoIncrement()();

  DateTimeColumn get createdAt => dateTime().nullable()();

  IntColumn get id => integer().nullable()();

  TextColumn get plateNumber => text().nullable()();

  IntColumn get vehiculeType =>
      integer().references(VehiculeTypeTable, #id).nullable()();

  RealColumn get amount => real().nullable()();

  TextColumn get reference => text().nullable()();

  TextColumn get method => textEnum<Method>().nullable()();
}
