import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_collect/core/utils/shared_preference_key.dart';

part 'initializer_event.dart';

part 'initializer_state.dart';

part 'initializer_bloc.g.dart';

class InitializerBloc extends Bloc<InitializerEvent, InitializerState> {
  InitializerBloc() : super(const InitializerState()) {
    on<InitializerEvent>((event, emit) {});

    on<GetUserLoginEvent>(_onGetUserLoginEvent);
  }

  FutureOr<void> _onGetUserLoginEvent(
    GetUserLoginEvent event,
    Emitter<InitializerState> emit,
  ) async {
    ///Should get it from the resource;
    var preference = GetIt.I<SharedPreferences>();
    var isLogin = preference.getBool(SharedPreferenceKey.isLogin);
    emit(state.copyWith(isLogin: isLogin));
  }
}
