// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentModelCWProxy {
  PaymentModel createdAt(DateTime? createdAt);

  PaymentModel id(int? id);

  PaymentModel plateNumber(String? plateNumber);

  PaymentModel method(String? method);

  PaymentModel amount(double? amount);

  PaymentModel reference(String? reference);

  PaymentModel vehiculeType(int? vehiculeType);

  PaymentModel vehiculeTypeEntity(VehiculeTypeModel? vehiculeTypeEntity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentModel call({
    DateTime? createdAt,
    int? id,
    String? plateNumber,
    String? method,
    double? amount,
    String? reference,
    int? vehiculeType,
    VehiculeTypeModel? vehiculeTypeEntity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaymentModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaymentModel.copyWith.fieldName(...)`
class _$PaymentModelCWProxyImpl implements _$PaymentModelCWProxy {
  const _$PaymentModelCWProxyImpl(this._value);

  final PaymentModel _value;

  @override
  PaymentModel createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  PaymentModel id(int? id) => this(id: id);

  @override
  PaymentModel plateNumber(String? plateNumber) =>
      this(plateNumber: plateNumber);

  @override
  PaymentModel method(String? method) => this(method: method);

  @override
  PaymentModel amount(double? amount) => this(amount: amount);

  @override
  PaymentModel reference(String? reference) => this(reference: reference);

  @override
  PaymentModel vehiculeType(int? vehiculeType) =>
      this(vehiculeType: vehiculeType);

  @override
  PaymentModel vehiculeTypeEntity(VehiculeTypeModel? vehiculeTypeEntity) =>
      this(vehiculeTypeEntity: vehiculeTypeEntity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentModel call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? plateNumber = const $CopyWithPlaceholder(),
    Object? method = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? reference = const $CopyWithPlaceholder(),
    Object? vehiculeType = const $CopyWithPlaceholder(),
    Object? vehiculeTypeEntity = const $CopyWithPlaceholder(),
  }) {
    return PaymentModel(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      plateNumber: plateNumber == const $CopyWithPlaceholder()
          ? _value.plateNumber
          // ignore: cast_nullable_to_non_nullable
          : plateNumber as String?,
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String?,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as double?,
      reference: reference == const $CopyWithPlaceholder()
          ? _value.reference
          // ignore: cast_nullable_to_non_nullable
          : reference as String?,
      vehiculeType: vehiculeType == const $CopyWithPlaceholder()
          ? _value.vehiculeType
          // ignore: cast_nullable_to_non_nullable
          : vehiculeType as int?,
      vehiculeTypeEntity: vehiculeTypeEntity == const $CopyWithPlaceholder()
          ? _value.vehiculeTypeEntity
          // ignore: cast_nullable_to_non_nullable
          : vehiculeTypeEntity as VehiculeTypeModel?,
    );
  }
}

extension $PaymentModelCopyWith on PaymentModel {
  /// Returns a callable class that can be used as follows: `instanceOfPaymentModel.copyWith(...)` or like so:`instanceOfPaymentModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentModelCWProxy get copyWith => _$PaymentModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: (json['id'] as num?)?.toInt(),
      plateNumber: json['plate_number'] as String?,
      method: json['method'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      reference: json['reference'] as String?,
      vehiculeType: (json['vehicule_type'] as num?)?.toInt(),
      vehiculeTypeEntity: PaymentModel._vehiculeTypeFromJson(
          json['vehiculeTypeEntity'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'plate_number': instance.plateNumber,
      'method': instance.method,
      'amount': instance.amount,
      'vehicule_type': instance.vehiculeType,
      'reference': instance.reference,
      'vehiculeTypeEntity':
          PaymentModel._vehiculeTypeToJson(instance.vehiculeTypeEntity),
    };
