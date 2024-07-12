import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_collect/core/utils/error_handler.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/feature/ticket/domain/entities/vehicule_type_entity.dart';
import 'package:tax_collect/feature/ticket/domain/use_cases/save_payment.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../../../../core/data/database/table/payment_table.dart';
import '../../domain/entities/payment_entity.dart';

part 'ticket_event.dart';

part 'ticket_state.dart';

part 'ticket_bloc.g.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final SavePayment savePayment;

  TicketBloc({
    required this.savePayment,
  }) : super(const TicketState()) {
    on<InitTicketEvent>(_onInitTicketEvent);
    on<MakePaymentEvent>(_onMakePaymentEvent);
    on<SelectVehiculeEvent>(_onSelectVehicule);
    on<EnterPlateNumberEvent>(_onEnterPlateNumberEvent);
    on<EnterPhoneNumberEvent>(_onEnterPhoneNumberEvent);
  }

  FutureOr<void> _onInitTicketEvent(
    InitTicketEvent event,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(
      selectedVehiculeTypeEntity: null,
      blocState: BlocState.initial,
      plateNumber: null,
      message: null,
      paymentEntityResult: null,
      phoneNumber: null,
    ));
  }

  FutureOr<void> _onSelectVehicule(
    SelectVehiculeEvent event,
    Emitter<TicketState> emit,
  ) async {
    if (event.vehiculeTypeEntity != null) {
      emit(
        state.copyWith(
          selectedVehiculeTypeEntity: event.vehiculeTypeEntity,
        ),
      );
    }
  }

  FutureOr<void> _onEnterPlateNumberEvent(
    EnterPlateNumberEvent event,
    Emitter<TicketState> emit,
  ) async {
    if (event.plate != null) {
      emit(
        state.copyWith(plateNumber: event.plate?.toUpperCase()),
      );
    }
  }

  FutureOr<void> _onMakePaymentEvent(
    MakePaymentEvent event,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(
      blocState: BlocState.loading,
      message: LocaleKeys.please_wait,
    ));

    PaymentEntity paymentEntity = PaymentEntity(
      createdAt: DateTime.now(),
      vehiculeType: state.selectedVehiculeTypeEntity?.id,
      plateNumber: state.plateNumber,
      method: event.method?.name,
      amount: state.selectedVehiculeTypeEntity?.price,
      reference: null,
      vehiculeTypeEntity: state.selectedVehiculeTypeEntity,
    );

    await Future.delayed(const Duration(seconds: 2));

    await errorHandler(() async => savePayment(paymentEntity)).either((fnL) {
      emit(state.copyWith(
        message: fnL.message,
        blocState: BlocState.failed,
      ));
    }, (fnR) {
      if (fnR != null) {
        emit(
          state.copyWith(
            message: LocaleKeys.payment_successful,
            paymentEntityResult: fnR,
            blocState: BlocState.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            blocState: BlocState.failed,
            message: LocaleKeys.error_happened,
          ),
        );
      }
    });
  }

  FutureOr<void> _onEnterPhoneNumberEvent(
    EnterPhoneNumberEvent event,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }
}
