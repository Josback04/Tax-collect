// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VehiculeTypeTableTable extends VehiculeTypeTable
    with TableInfo<$VehiculeTypeTableTable, vehicule_type> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiculeTypeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idLocalMeta =
      const VerificationMeta('idLocal');
  @override
  late final GeneratedColumn<int> idLocal = GeneratedColumn<int>(
      'id_local', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [idLocal, id, type, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicule_type_table';
  @override
  VerificationContext validateIntegrity(Insertable<vehicule_type> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_local')) {
      context.handle(_idLocalMeta,
          idLocal.isAcceptableOrUnknown(data['id_local']!, _idLocalMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idLocal};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {id},
      ];
  @override
  vehicule_type map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return vehicule_type(
      idLocal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_local'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
    );
  }

  @override
  $VehiculeTypeTableTable createAlias(String alias) {
    return $VehiculeTypeTableTable(attachedDatabase, alias);
  }
}

class vehicule_type extends DataClass implements Insertable<vehicule_type> {
  final int idLocal;
  final int? id;
  final String? type;
  final double? price;
  const vehicule_type({required this.idLocal, this.id, this.type, this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_local'] = Variable<int>(idLocal);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  VehiculeTypeTableCompanion toCompanion(bool nullToAbsent) {
    return VehiculeTypeTableCompanion(
      idLocal: Value(idLocal),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory vehicule_type.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return vehicule_type(
      idLocal: serializer.fromJson<int>(json['idLocal']),
      id: serializer.fromJson<int?>(json['id']),
      type: serializer.fromJson<String?>(json['type']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idLocal': serializer.toJson<int>(idLocal),
      'id': serializer.toJson<int?>(id),
      'type': serializer.toJson<String?>(type),
      'price': serializer.toJson<double?>(price),
    };
  }

  vehicule_type copyWith(
          {int? idLocal,
          Value<int?> id = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<double?> price = const Value.absent()}) =>
      vehicule_type(
        idLocal: idLocal ?? this.idLocal,
        id: id.present ? id.value : this.id,
        type: type.present ? type.value : this.type,
        price: price.present ? price.value : this.price,
      );
  @override
  String toString() {
    return (StringBuffer('vehicule_type(')
          ..write('idLocal: $idLocal, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idLocal, id, type, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is vehicule_type &&
          other.idLocal == this.idLocal &&
          other.id == this.id &&
          other.type == this.type &&
          other.price == this.price);
}

class VehiculeTypeTableCompanion extends UpdateCompanion<vehicule_type> {
  final Value<int> idLocal;
  final Value<int?> id;
  final Value<String?> type;
  final Value<double?> price;
  const VehiculeTypeTableCompanion({
    this.idLocal = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.price = const Value.absent(),
  });
  VehiculeTypeTableCompanion.insert({
    this.idLocal = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.price = const Value.absent(),
  });
  static Insertable<vehicule_type> custom({
    Expression<int>? idLocal,
    Expression<int>? id,
    Expression<String>? type,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (idLocal != null) 'id_local': idLocal,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (price != null) 'price': price,
    });
  }

  VehiculeTypeTableCompanion copyWith(
      {Value<int>? idLocal,
      Value<int?>? id,
      Value<String?>? type,
      Value<double?>? price}) {
    return VehiculeTypeTableCompanion(
      idLocal: idLocal ?? this.idLocal,
      id: id ?? this.id,
      type: type ?? this.type,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idLocal.present) {
      map['id_local'] = Variable<int>(idLocal.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiculeTypeTableCompanion(')
          ..write('idLocal: $idLocal, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $PaymentTableTable extends PaymentTable
    with TableInfo<$PaymentTableTable, payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idLocalMeta =
      const VerificationMeta('idLocal');
  @override
  late final GeneratedColumn<int> idLocal = GeneratedColumn<int>(
      'id_local', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _plateNumberMeta =
      const VerificationMeta('plateNumber');
  @override
  late final GeneratedColumn<String> plateNumber = GeneratedColumn<String>(
      'plate_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vehiculeTypeMeta =
      const VerificationMeta('vehiculeType');
  @override
  late final GeneratedColumn<int> vehiculeType = GeneratedColumn<int>(
      'vehicule_type', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vehicule_type_table (id)'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _referenceMeta =
      const VerificationMeta('reference');
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
      'reference', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumnWithTypeConverter<Method?, String> method =
      GeneratedColumn<String>('method', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Method?>($PaymentTableTable.$convertermethodn);
  @override
  List<GeneratedColumn> get $columns => [
        idLocal,
        createdAt,
        id,
        plateNumber,
        vehiculeType,
        amount,
        reference,
        method
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_table';
  @override
  VerificationContext validateIntegrity(Insertable<payment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_local')) {
      context.handle(_idLocalMeta,
          idLocal.isAcceptableOrUnknown(data['id_local']!, _idLocalMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plate_number')) {
      context.handle(
          _plateNumberMeta,
          plateNumber.isAcceptableOrUnknown(
              data['plate_number']!, _plateNumberMeta));
    }
    if (data.containsKey('vehicule_type')) {
      context.handle(
          _vehiculeTypeMeta,
          vehiculeType.isAcceptableOrUnknown(
              data['vehicule_type']!, _vehiculeTypeMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('reference')) {
      context.handle(_referenceMeta,
          reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta));
    }
    context.handle(_methodMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idLocal};
  @override
  payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return payment(
      idLocal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_local'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      plateNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plate_number']),
      vehiculeType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vehicule_type']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
      reference: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reference']),
      method: $PaymentTableTable.$convertermethodn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method'])),
    );
  }

  @override
  $PaymentTableTable createAlias(String alias) {
    return $PaymentTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Method, String, String> $convertermethod =
      const EnumNameConverter<Method>(Method.values);
  static JsonTypeConverter2<Method?, String?, String?> $convertermethodn =
      JsonTypeConverter2.asNullable($convertermethod);
}

class payment extends DataClass implements Insertable<payment> {
  final int idLocal;
  final DateTime? createdAt;
  final int? id;
  final String? plateNumber;
  final int? vehiculeType;
  final double? amount;
  final String? reference;
  final Method? method;
  const payment(
      {required this.idLocal,
      this.createdAt,
      this.id,
      this.plateNumber,
      this.vehiculeType,
      this.amount,
      this.reference,
      this.method});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_local'] = Variable<int>(idLocal);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || plateNumber != null) {
      map['plate_number'] = Variable<String>(plateNumber);
    }
    if (!nullToAbsent || vehiculeType != null) {
      map['vehicule_type'] = Variable<int>(vehiculeType);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || reference != null) {
      map['reference'] = Variable<String>(reference);
    }
    if (!nullToAbsent || method != null) {
      map['method'] =
          Variable<String>($PaymentTableTable.$convertermethodn.toSql(method));
    }
    return map;
  }

  PaymentTableCompanion toCompanion(bool nullToAbsent) {
    return PaymentTableCompanion(
      idLocal: Value(idLocal),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      plateNumber: plateNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(plateNumber),
      vehiculeType: vehiculeType == null && nullToAbsent
          ? const Value.absent()
          : Value(vehiculeType),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      reference: reference == null && nullToAbsent
          ? const Value.absent()
          : Value(reference),
      method:
          method == null && nullToAbsent ? const Value.absent() : Value(method),
    );
  }

  factory payment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return payment(
      idLocal: serializer.fromJson<int>(json['idLocal']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      id: serializer.fromJson<int?>(json['id']),
      plateNumber: serializer.fromJson<String?>(json['plateNumber']),
      vehiculeType: serializer.fromJson<int?>(json['vehiculeType']),
      amount: serializer.fromJson<double?>(json['amount']),
      reference: serializer.fromJson<String?>(json['reference']),
      method: $PaymentTableTable.$convertermethodn
          .fromJson(serializer.fromJson<String?>(json['method'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idLocal': serializer.toJson<int>(idLocal),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'id': serializer.toJson<int?>(id),
      'plateNumber': serializer.toJson<String?>(plateNumber),
      'vehiculeType': serializer.toJson<int?>(vehiculeType),
      'amount': serializer.toJson<double?>(amount),
      'reference': serializer.toJson<String?>(reference),
      'method': serializer
          .toJson<String?>($PaymentTableTable.$convertermethodn.toJson(method)),
    };
  }

  payment copyWith(
          {int? idLocal,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<int?> id = const Value.absent(),
          Value<String?> plateNumber = const Value.absent(),
          Value<int?> vehiculeType = const Value.absent(),
          Value<double?> amount = const Value.absent(),
          Value<String?> reference = const Value.absent(),
          Value<Method?> method = const Value.absent()}) =>
      payment(
        idLocal: idLocal ?? this.idLocal,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        id: id.present ? id.value : this.id,
        plateNumber: plateNumber.present ? plateNumber.value : this.plateNumber,
        vehiculeType:
            vehiculeType.present ? vehiculeType.value : this.vehiculeType,
        amount: amount.present ? amount.value : this.amount,
        reference: reference.present ? reference.value : this.reference,
        method: method.present ? method.value : this.method,
      );
  @override
  String toString() {
    return (StringBuffer('payment(')
          ..write('idLocal: $idLocal, ')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id, ')
          ..write('plateNumber: $plateNumber, ')
          ..write('vehiculeType: $vehiculeType, ')
          ..write('amount: $amount, ')
          ..write('reference: $reference, ')
          ..write('method: $method')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idLocal, createdAt, id, plateNumber,
      vehiculeType, amount, reference, method);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is payment &&
          other.idLocal == this.idLocal &&
          other.createdAt == this.createdAt &&
          other.id == this.id &&
          other.plateNumber == this.plateNumber &&
          other.vehiculeType == this.vehiculeType &&
          other.amount == this.amount &&
          other.reference == this.reference &&
          other.method == this.method);
}

class PaymentTableCompanion extends UpdateCompanion<payment> {
  final Value<int> idLocal;
  final Value<DateTime?> createdAt;
  final Value<int?> id;
  final Value<String?> plateNumber;
  final Value<int?> vehiculeType;
  final Value<double?> amount;
  final Value<String?> reference;
  final Value<Method?> method;
  const PaymentTableCompanion({
    this.idLocal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.id = const Value.absent(),
    this.plateNumber = const Value.absent(),
    this.vehiculeType = const Value.absent(),
    this.amount = const Value.absent(),
    this.reference = const Value.absent(),
    this.method = const Value.absent(),
  });
  PaymentTableCompanion.insert({
    this.idLocal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.id = const Value.absent(),
    this.plateNumber = const Value.absent(),
    this.vehiculeType = const Value.absent(),
    this.amount = const Value.absent(),
    this.reference = const Value.absent(),
    this.method = const Value.absent(),
  });
  static Insertable<payment> custom({
    Expression<int>? idLocal,
    Expression<DateTime>? createdAt,
    Expression<int>? id,
    Expression<String>? plateNumber,
    Expression<int>? vehiculeType,
    Expression<double>? amount,
    Expression<String>? reference,
    Expression<String>? method,
  }) {
    return RawValuesInsertable({
      if (idLocal != null) 'id_local': idLocal,
      if (createdAt != null) 'created_at': createdAt,
      if (id != null) 'id': id,
      if (plateNumber != null) 'plate_number': plateNumber,
      if (vehiculeType != null) 'vehicule_type': vehiculeType,
      if (amount != null) 'amount': amount,
      if (reference != null) 'reference': reference,
      if (method != null) 'method': method,
    });
  }

  PaymentTableCompanion copyWith(
      {Value<int>? idLocal,
      Value<DateTime?>? createdAt,
      Value<int?>? id,
      Value<String?>? plateNumber,
      Value<int?>? vehiculeType,
      Value<double?>? amount,
      Value<String?>? reference,
      Value<Method?>? method}) {
    return PaymentTableCompanion(
      idLocal: idLocal ?? this.idLocal,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      plateNumber: plateNumber ?? this.plateNumber,
      vehiculeType: vehiculeType ?? this.vehiculeType,
      amount: amount ?? this.amount,
      reference: reference ?? this.reference,
      method: method ?? this.method,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idLocal.present) {
      map['id_local'] = Variable<int>(idLocal.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (plateNumber.present) {
      map['plate_number'] = Variable<String>(plateNumber.value);
    }
    if (vehiculeType.present) {
      map['vehicule_type'] = Variable<int>(vehiculeType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(
          $PaymentTableTable.$convertermethodn.toSql(method.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentTableCompanion(')
          ..write('idLocal: $idLocal, ')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id, ')
          ..write('plateNumber: $plateNumber, ')
          ..write('vehiculeType: $vehiculeType, ')
          ..write('amount: $amount, ')
          ..write('reference: $reference, ')
          ..write('method: $method')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $VehiculeTypeTableTable vehiculeTypeTable =
      $VehiculeTypeTableTable(this);
  late final $PaymentTableTable paymentTable = $PaymentTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [vehiculeTypeTable, paymentTable];
}

typedef $$VehiculeTypeTableTableInsertCompanionBuilder
    = VehiculeTypeTableCompanion Function({
  Value<int> idLocal,
  Value<int?> id,
  Value<String?> type,
  Value<double?> price,
});
typedef $$VehiculeTypeTableTableUpdateCompanionBuilder
    = VehiculeTypeTableCompanion Function({
  Value<int> idLocal,
  Value<int?> id,
  Value<String?> type,
  Value<double?> price,
});

class $$VehiculeTypeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VehiculeTypeTableTable,
    vehicule_type,
    $$VehiculeTypeTableTableFilterComposer,
    $$VehiculeTypeTableTableOrderingComposer,
    $$VehiculeTypeTableTableProcessedTableManager,
    $$VehiculeTypeTableTableInsertCompanionBuilder,
    $$VehiculeTypeTableTableUpdateCompanionBuilder> {
  $$VehiculeTypeTableTableTableManager(
      _$AppDatabase db, $VehiculeTypeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$VehiculeTypeTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$VehiculeTypeTableTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$VehiculeTypeTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> idLocal = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<double?> price = const Value.absent(),
          }) =>
              VehiculeTypeTableCompanion(
            idLocal: idLocal,
            id: id,
            type: type,
            price: price,
          ),
          getInsertCompanionBuilder: ({
            Value<int> idLocal = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<double?> price = const Value.absent(),
          }) =>
              VehiculeTypeTableCompanion.insert(
            idLocal: idLocal,
            id: id,
            type: type,
            price: price,
          ),
        ));
}

class $$VehiculeTypeTableTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $VehiculeTypeTableTable,
        vehicule_type,
        $$VehiculeTypeTableTableFilterComposer,
        $$VehiculeTypeTableTableOrderingComposer,
        $$VehiculeTypeTableTableProcessedTableManager,
        $$VehiculeTypeTableTableInsertCompanionBuilder,
        $$VehiculeTypeTableTableUpdateCompanionBuilder> {
  $$VehiculeTypeTableTableProcessedTableManager(super.$state);
}

class $$VehiculeTypeTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $VehiculeTypeTableTable> {
  $$VehiculeTypeTableTableFilterComposer(super.$state);
  ColumnFilters<int> get idLocal => $state.composableBuilder(
      column: $state.table.idLocal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter paymentTableRefs(
      ComposableFilter Function($$PaymentTableTableFilterComposer f) f) {
    final $$PaymentTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.paymentTable,
        getReferencedColumn: (t) => t.vehiculeType,
        builder: (joinBuilder, parentComposers) =>
            $$PaymentTableTableFilterComposer(ComposerState($state.db,
                $state.db.paymentTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$VehiculeTypeTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $VehiculeTypeTableTable> {
  $$VehiculeTypeTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get idLocal => $state.composableBuilder(
      column: $state.table.idLocal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PaymentTableTableInsertCompanionBuilder = PaymentTableCompanion
    Function({
  Value<int> idLocal,
  Value<DateTime?> createdAt,
  Value<int?> id,
  Value<String?> plateNumber,
  Value<int?> vehiculeType,
  Value<double?> amount,
  Value<String?> reference,
  Value<Method?> method,
});
typedef $$PaymentTableTableUpdateCompanionBuilder = PaymentTableCompanion
    Function({
  Value<int> idLocal,
  Value<DateTime?> createdAt,
  Value<int?> id,
  Value<String?> plateNumber,
  Value<int?> vehiculeType,
  Value<double?> amount,
  Value<String?> reference,
  Value<Method?> method,
});

class $$PaymentTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentTableTable,
    payment,
    $$PaymentTableTableFilterComposer,
    $$PaymentTableTableOrderingComposer,
    $$PaymentTableTableProcessedTableManager,
    $$PaymentTableTableInsertCompanionBuilder,
    $$PaymentTableTableUpdateCompanionBuilder> {
  $$PaymentTableTableTableManager(_$AppDatabase db, $PaymentTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PaymentTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PaymentTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PaymentTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> idLocal = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String?> plateNumber = const Value.absent(),
            Value<int?> vehiculeType = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<String?> reference = const Value.absent(),
            Value<Method?> method = const Value.absent(),
          }) =>
              PaymentTableCompanion(
            idLocal: idLocal,
            createdAt: createdAt,
            id: id,
            plateNumber: plateNumber,
            vehiculeType: vehiculeType,
            amount: amount,
            reference: reference,
            method: method,
          ),
          getInsertCompanionBuilder: ({
            Value<int> idLocal = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String?> plateNumber = const Value.absent(),
            Value<int?> vehiculeType = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<String?> reference = const Value.absent(),
            Value<Method?> method = const Value.absent(),
          }) =>
              PaymentTableCompanion.insert(
            idLocal: idLocal,
            createdAt: createdAt,
            id: id,
            plateNumber: plateNumber,
            vehiculeType: vehiculeType,
            amount: amount,
            reference: reference,
            method: method,
          ),
        ));
}

class $$PaymentTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $PaymentTableTable,
    payment,
    $$PaymentTableTableFilterComposer,
    $$PaymentTableTableOrderingComposer,
    $$PaymentTableTableProcessedTableManager,
    $$PaymentTableTableInsertCompanionBuilder,
    $$PaymentTableTableUpdateCompanionBuilder> {
  $$PaymentTableTableProcessedTableManager(super.$state);
}

class $$PaymentTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PaymentTableTable> {
  $$PaymentTableTableFilterComposer(super.$state);
  ColumnFilters<int> get idLocal => $state.composableBuilder(
      column: $state.table.idLocal,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get plateNumber => $state.composableBuilder(
      column: $state.table.plateNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reference => $state.composableBuilder(
      column: $state.table.reference,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Method?, Method, String> get method =>
      $state.composableBuilder(
          column: $state.table.method,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  $$VehiculeTypeTableTableFilterComposer get vehiculeType {
    final $$VehiculeTypeTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.vehiculeType,
            referencedTable: $state.db.vehiculeTypeTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$VehiculeTypeTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.vehiculeTypeTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$PaymentTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PaymentTableTable> {
  $$PaymentTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get idLocal => $state.composableBuilder(
      column: $state.table.idLocal,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get plateNumber => $state.composableBuilder(
      column: $state.table.plateNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reference => $state.composableBuilder(
      column: $state.table.reference,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get method => $state.composableBuilder(
      column: $state.table.method,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$VehiculeTypeTableTableOrderingComposer get vehiculeType {
    final $$VehiculeTypeTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.vehiculeType,
            referencedTable: $state.db.vehiculeTypeTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$VehiculeTypeTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.vehiculeTypeTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$VehiculeTypeTableTableTableManager get vehiculeTypeTable =>
      $$VehiculeTypeTableTableTableManager(_db, _db.vehiculeTypeTable);
  $$PaymentTableTableTableManager get paymentTable =>
      $$PaymentTableTableTableManager(_db, _db.paymentTable);
}
