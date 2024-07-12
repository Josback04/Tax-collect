// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initializer_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InitializerStateCWProxy {
  InitializerState isLogin(bool? isLogin);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InitializerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InitializerState(...).copyWith(id: 12, name: "My name")
  /// ````
  InitializerState call({
    bool? isLogin,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInitializerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInitializerState.copyWith.fieldName(...)`
class _$InitializerStateCWProxyImpl implements _$InitializerStateCWProxy {
  const _$InitializerStateCWProxyImpl(this._value);

  final InitializerState _value;

  @override
  InitializerState isLogin(bool? isLogin) => this(isLogin: isLogin);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InitializerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InitializerState(...).copyWith(id: 12, name: "My name")
  /// ````
  InitializerState call({
    Object? isLogin = const $CopyWithPlaceholder(),
  }) {
    return InitializerState(
      isLogin: isLogin == const $CopyWithPlaceholder()
          ? _value.isLogin
          // ignore: cast_nullable_to_non_nullable
          : isLogin as bool?,
    );
  }
}

extension $InitializerStateCopyWith on InitializerState {
  /// Returns a callable class that can be used as follows: `instanceOfInitializerState.copyWith(...)` or like so:`instanceOfInitializerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InitializerStateCWProxy get copyWith => _$InitializerStateCWProxyImpl(this);
}
