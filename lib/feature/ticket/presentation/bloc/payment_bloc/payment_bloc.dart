import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tax_collect/core/utils/error_handler.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/feature/ticket/data/repositories/payment_repository_impl.dart';
import 'package:tax_collect/feature/ticket/domain/use_cases/get_pay_usecase.dart';
import 'package:tax_collect/feature/ticket/domain/use_cases/pay_usecase.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends HydratedBloc<PaymentEvent, PaymentState> {
  PaymentBloc({required PaymentRepositoryImpl paymentRepositoryImpl})
      : _paymentRepositoryImpl = paymentRepositoryImpl,
        super(const PaymentState()) {
    payUsecase = PayUsecase(repository: _paymentRepositoryImpl);
    getUsecase = GetUsecase(repository: _paymentRepositoryImpl);

    on<TimerProgress>((event, emit) {
      emit(state.copyWith(progress: event.value));
      if (event.value == 0) {
        _ticketTimer?.cancel();
        _pendingTimer?.cancel();
        return emit(state.copyWith(
          paymentState: BlocState.failed,
          timerState: TimerStatus.stop,
          message: "Le paiement n'a pas résussi",
        ));
      }
    });
    on<ResetTimer>((event, emit) {
      _ticketTimer?.cancel();
      _pendingTimer?.cancel();
      emit(state.copyWith(
        progress: 0,
        timerState: TimerStatus.initial,
        paymentState: BlocState.initial,
      ));
    });
    on<PendingOrderEvent>((event, emit) async {
      final result = await getUsecase.call(
        {'orderNumber': event.order},
      );
      if (result!.data!.message! == "Le paiement n'a pas réussi") {
        _ticketTimer?.cancel();
        _pendingTimer?.cancel();
        return emit(state.copyWith(
          paymentState: BlocState.failed,
          timerState: TimerStatus.stop,
          message: result.data!.message,
        ));
      }
    });
    on<DoPaymentEvent>(
      (event, emit) => errorHandler(
        () async {
          emit(
            state.copyWith(
              paymentState: BlocState.loading,
              timerState: TimerStatus.start,
            ),
          );

          final result = await payUsecase.call(
            {
              'type': 'mobile',
              'phone': '243${event.phone}',
              'amount': event.amount,
              'currency': 'CDF',
            },
          );

          _ticketTimer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) => add(TimerProgress(value: 60 - timer.tick)),
          );

          if (result!.data?.orderNumber == null) {
            return throw Exception('${result.data!.message}');
          }
          _pendingTimer = Timer.periodic(
            const Duration(seconds: 10),
            (timer) => add(PendingOrderEvent(result.data!.orderNumber!)),
          );
        },
      ).either(
          (left) => emit(
                state.copyWith(
                    paymentState: BlocState.failed,
                    message: "Une erreur s'est produite"),
              ),
          (right) => null),
    );
  }

  late final PayUsecase payUsecase;
  late final GetUsecase getUsecase;
  final PaymentRepositoryImpl _paymentRepositoryImpl;

  Timer? _ticketTimer;
  Timer? _pendingTimer;
  @override
  PaymentState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(PaymentState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
