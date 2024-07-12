import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:tax_collect/core/models/no_param.dart';
import 'package:tax_collect/core/utils/error_handler.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/feature/auth/domain/entities/login_params.dart';
import 'package:tax_collect/feature/auth/domain/use_cases/save_user_data.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../../domain/use_cases/get_user_data.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.g.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SaveUserData saveUserData;
  final GetUserData getUserData;

  AuthBloc({
    required this.saveUserData,
    required this.getUserData,
  }) : super(const AuthState()) {
    on<LoginEvent>(_onLoginEvent);
    on<GetUserEvent>(_onGetUserEvent);
  }

  FutureOr<void> _onLoginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(loginState: AuthenticationState.loading));
    await Future.delayed(const Duration(seconds: 3));
    await errorHandler(() async => await saveUserData(
            LoginParams(username: event.username, password: event.password)))
        .either(
      (failure) {
        var e = failure.error;
        if (e is DioException) {
          emit(
            state.copyWith(
              message: failure.message,
              loginState: AuthenticationState.failure,
            ),
          );
        } else {
          emit(
            state.copyWith(
              message: failure.message,
              loginState: AuthenticationState.failure,
            ),
          );
        }
      },
      (isSaved) {
        if (isSaved) {
          emit(state.copyWith(
              message: LocaleKeys.login_success,
              username: event.username,
              loginState: AuthenticationState.authenticated));
        } else {
          emit(
            state.copyWith(
              message: LocaleKeys.error_happened,
              loginState: AuthenticationState.failure,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _onGetUserEvent(
    GetUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    await errorHandler(() async => await getUserData(NoParams())).either((fnL) {
      emit(
        state.copyWith(
          message: fnL.message,
          loginState: AuthenticationState.failure,
        ),
      );
    }, (fnR) {
      if (fnR != null) {
        emit(state.copyWith(
          loginState: AuthenticationState.authenticated,
          username: fnR,
        ));
      } else {
        emit(state.copyWith(
          message: LocaleKeys.error_happened,
          loginState: AuthenticationState.failure,
        ));
      }
    });
  }
}
