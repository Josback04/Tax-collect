// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicule_type_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VehiculeTypeModelCWProxy {
  VehiculeTypeModel id(int? id);

  VehiculeTypeModel type(String? type);

  VehiculeTypeModel price(double? price);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VehiculeTypeModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VehiculeTypeModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VehiculeTypeModel call({
    int? id,
    String? type,
    double? price,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVehiculeTypeModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVehiculeTypeModel.copyWith.fieldName(...)`
class _$VehiculeTypeModelCWProxyImpl implements _$VehiculeTypeModelCWProxy {
  const _$VehiculeTypeModelCWProxyImpl(this._value);

  final VehiculeTypeModel _value;

  @override
  VehiculeTypeModel id(int? id) => this(id: id);

  @override
  VehiculeTypeModel type(String? type) => this(type: type);

  @override
  VehiculeTypeModel price(double? price) => this(price: price);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VehiculeTypeModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VehiculeTypeModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VehiculeTypeModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
  }) {
    return VehiculeTypeModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double?,
    );
  }
}

extension $VehiculeTypeModelCopyWith on VehiculeTypeModel {
  /// Returns a callable class that can be used as follows: `instanceOfVehiculeTypeModel.copyWith(...)` or like so:`instanceOfVehiculeTypeModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VehiculeTypeModelCWProxy get copyWith =>
      _$VehiculeTypeModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiculeTypeModel _$VehiculeTypeModelFromJson(Map<String, dynamic> json) =>
    VehiculeTypeModel(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehiculeTypeModelToJson(VehiculeTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'price': instance.price,
    };
