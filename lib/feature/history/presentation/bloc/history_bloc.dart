import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tax_collect/core/models/no_param.dart';
import 'package:tax_collect/core/utils/error_handler.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/feature/history/domain/use_cases/get_payment_list.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

part 'history_event.dart';

part 'history_state.dart';

part 'history_bloc.g.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetPaymentList getPaymentList;

  HistoryBloc({required this.getPaymentList}) : super(const HistoryState()) {
    on<InitHistory>(_onInitHistory);
  }

  FutureOr<void> _onInitHistory(
    InitHistory event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(
      blocState: BlocState.loading,
      message: LocaleKeys.loading,
    ));
    await errorHandler(() async => await getPaymentList(NoParams())).either(
        (fnL) {
      emit(state.copyWith(
        message: fnL.message,
        blocState: BlocState.failed,
      ));
    }, (fnR) {
      emit(state.copyWith(
        paymentList: fnR,
        blocState: BlocState.success,
      ));
    });
  }
}
