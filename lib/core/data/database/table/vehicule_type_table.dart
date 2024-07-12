import 'package:drift/drift.dart';

@DataClassName('vehicule_type')
class VehiculeTypeTable extends Table {
  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
    {id},
  ];
  IntColumn get idLocal => integer().autoIncrement()();

  IntColumn get id => integer().nullable()();

  TextColumn get type => text().nullable()();

  RealColumn get price => real().nullable()();
}
