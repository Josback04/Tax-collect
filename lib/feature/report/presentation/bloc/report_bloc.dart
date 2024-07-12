import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_collect/core/data/database/app_database.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/feature/report/data/models/method_summary_model.dart';
import 'package:tax_collect/feature/report/data/models/vehicule_summary_model.dart';
import 'package:tax_collect/feature/report/domain/entities/method_summary_entity.dart';
import 'package:tax_collect/feature/report/domain/entities/vehicule_summary_entity.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';

part 'report_event.dart';

part 'report_state.dart';

part 'report_bloc.g.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(const ReportState()) {
    on<InitReportEvent>(_onInitReportEvent);
  }

  FutureOr<void> _onInitReportEvent(
    InitReportEvent event,
    Emitter<ReportState> emit,
  ) async {
    final paymentList = event.paymentList ?? [];

    // Calculate total amount
    final totalAmount =
        paymentList.fold(0.0, (prev, pay) => prev + (pay.amount ?? 0));

    // Get unique vehicle types and create a map for summaries
    final uniqueVehicleTypes =
        paymentList.map((p) => p.vehiculeTypeEntity).toSet();

    final vehicleSummaryMap = {
      for (var type in uniqueVehicleTypes)
        type: VehiculeSummaryEntity(
            vehiculeTypeEntity: type, total: 0.0, count: 0)
    };

    // Get unique method payment and create a map for summaries
    final uniqueMethod = paymentList.map((p) => p.method).toSet();

    final methodMap = {
      for (var method in uniqueMethod)
        method: MethodSummaryEntity(method: method, total: 0.0, count: 0),
    };

    // Update summary for each payment
    for (final payment in paymentList) {
      //vehicule Type
      final vehicleType = payment.vehiculeTypeEntity;
      if (vehicleSummaryMap.containsKey(vehicleType)) {
        final summary = vehicleSummaryMap[vehicleType]!;
        final updatedSummary = summary.toModel().copyWith(
              total: summary.total + (payment.amount ?? 0),
              count: summary.count + 1,
            );
        vehicleSummaryMap[vehicleType] = updatedSummary;
      }
      //Method payment
      final method = payment.method;
      if (methodMap.containsKey(method)) {
        final summary = methodMap[method]!;
        final updatedSummary = summary.toModel().copyWith(
              total: summary.total + (payment.amount ?? 0),
              count: summary.count + 1,
            );
        methodMap[method] = updatedSummary;
      }
    }

    // Convert the map to a list
    final vehiculeSummaryList = vehicleSummaryMap.values.toList();

    final methodSummaryList = methodMap.values.toList();

    emit(state.copyWith(
      dateTime: event.dateTime,
      paymentList: paymentList,
      totalAmount: totalAmount,
      vehiculeSummaryList: vehiculeSummaryList,
      methodSummaryList: methodSummaryList,
    ));
  }
}
