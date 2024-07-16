// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketStateCWProxy {
  TicketState blocState(BlocState blocState);

  TicketState paymentState(BlocState paymentState);

  TicketState plateNumber(String? plateNumber);

  TicketState message(String? message);

  TicketState phoneNumber(String? phoneNumber);

  TicketState paymentEntityResult(PaymentEntity? paymentEntityResult);

  TicketState selectedVehiculeTypeEntity(
      VehiculeTypeEntity? selectedVehiculeTypeEntity);

  TicketState statusCode(int? statusCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketState(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketState call({
    BlocState? blocState,
    BlocState? paymentState,
    String? plateNumber,
    String? message,
    String? phoneNumber,
    PaymentEntity? paymentEntityResult,
    VehiculeTypeEntity? selectedVehiculeTypeEntity,
    int? statusCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketState.copyWith.fieldName(...)`
class _$TicketStateCWProxyImpl implements _$TicketStateCWProxy {
  const _$TicketStateCWProxyImpl(this._value);

  final TicketState _value;

  @override
  TicketState blocState(BlocState blocState) => this(blocState: blocState);

  @override
  TicketState paymentState(BlocState paymentState) =>
      this(paymentState: paymentState);

  @override
  TicketState plateNumber(String? plateNumber) =>
      this(plateNumber: plateNumber);

  @override
  TicketState message(String? message) => this(message: message);

  @override
  TicketState phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  TicketState paymentEntityResult(PaymentEntity? paymentEntityResult) =>
      this(paymentEntityResult: paymentEntityResult);

  @override
  TicketState selectedVehiculeTypeEntity(
          VehiculeTypeEntity? selectedVehiculeTypeEntity) =>
      this(selectedVehiculeTypeEntity: selectedVehiculeTypeEntity);

  @override
  TicketState statusCode(int? statusCode) => this(statusCode: statusCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketState(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketState call({
    Object? blocState = const $CopyWithPlaceholder(),
    Object? paymentState = const $CopyWithPlaceholder(),
    Object? plateNumber = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? paymentEntityResult = const $CopyWithPlaceholder(),
    Object? selectedVehiculeTypeEntity = const $CopyWithPlaceholder(),
    Object? statusCode = const $CopyWithPlaceholder(),
  }) {
    return TicketState(
      blocState: blocState == const $CopyWithPlaceholder() || blocState == null
          ? _value.blocState
          // ignore: cast_nullable_to_non_nullable
          : blocState as BlocState,
      paymentState:
          paymentState == const $CopyWithPlaceholder() || paymentState == null
              ? _value.paymentState
              // ignore: cast_nullable_to_non_nullable
              : paymentState as BlocState,
      plateNumber: plateNumber == const $CopyWithPlaceholder()
          ? _value.plateNumber
          // ignore: cast_nullable_to_non_nullable
          : plateNumber as String?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      paymentEntityResult: paymentEntityResult == const $CopyWithPlaceholder()
          ? _value.paymentEntityResult
          // ignore: cast_nullable_to_non_nullable
          : paymentEntityResult as PaymentEntity?,
      selectedVehiculeTypeEntity:
          selectedVehiculeTypeEntity == const $CopyWithPlaceholder()
              ? _value.selectedVehiculeTypeEntity
              // ignore: cast_nullable_to_non_nullable
              : selectedVehiculeTypeEntity as VehiculeTypeEntity?,
      statusCode: statusCode == const $CopyWithPlaceholder()
          ? _value.statusCode
          // ignore: cast_nullable_to_non_nullable
          : statusCode as int?,
    );
  }
}

extension $TicketStateCopyWith on TicketState {
  /// Returns a callable class that can be used as follows: `instanceOfTicketState.copyWith(...)` or like so:`instanceOfTicketState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketStateCWProxy get copyWith => _$TicketStateCWProxyImpl(this);
}
