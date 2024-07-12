import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_collect/core/utils/util.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/feature/ticket/domain/entities/payment_entity.dart';
import 'package:tax_collect/generated/locale_keys.g.dart ';
import 'package:thermal_printer/esc_pos_utils_platform/esc_pos_utils_platform.dart';

import '../constants.dart';

void printTicket(BuildContext context, PaymentEntity payment) {
  logger.f("result $payment \nvehicule ${payment.vehiculeTypeEntity}");

  context.read<SettingsBloc>().add(
        PrintTestDataEvent(
          textToPrint: [
            '${context.tr(LocaleKeys.bill)}: ${payment.id ?? ''}',
            '${context.tr(LocaleKeys.date)}: ${(payment.createdAt)?.formatDdMmmYyyyHhMm(context.locale.languageCode) ?? ''}',
            '${context.tr(LocaleKeys.plate_number)}: ${payment.plateNumber ?? ''}',
            '${context.tr(LocaleKeys.amount_received)} ${context.tr(payment.method ?? '')}: ${payment.amount.toStringAsMinFixed(1)} CDF',
            if (payment.reference != null)
              '${context.tr(LocaleKeys.reference)}: ${payment.reference}',
            '${context.tr(LocaleKeys.vehicule_type)}: ${payment.vehiculeTypeEntity?.type ?? ''}',
          ],
          paperSize: PaperSize.mm58,
        ),
      );
}
