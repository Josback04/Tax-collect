import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/util.dart';
import 'package:tax_collect/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:tax_collect/feature/history/presentation/bloc/history_bloc.dart';
import 'package:tax_collect/feature/report/presentation/bloc/report_bloc.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';
import 'package:thermal_printer/esc_pos_utils_platform/src/enums.dart';

@RoutePage()
class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  var reportDate = DateTime.now();
  String? username;

  @override
  void initState() {
    context.read<HistoryBloc>().add(const InitHistory());
    username = context.read<AuthBloc>().state.username;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HistoryBloc, HistoryState>(
      listener: (context, state) {
        context.read<ReportBloc>().add(
              InitReportEvent(
                paymentList: state.paymentList ?? [],
                dateTime: reportDate,
              ),
            );
      },
      child: BlocBuilder<ReportBloc, ReportState>(
        builder: (context, state) {
          var agentLine = "${context.tr(LocaleKeys.agent)}: $username";
          var dateLine =
              "${context.tr(LocaleKeys.report_date)}: ${state.dateTime.formatDdMmmYyyyHhMm(context.locale.languageCode)}";
          var summaryVehiculeLineList = (state.vehiculeSummaryList)
              .map((sum) =>
                  "• ${sum.count} ${sum.vehiculeTypeEntity?.type ?? ''}: ${sum.total.toStringAsMinFixed(1)} CDF")
              .toList();

          var summaryMethodLineList = (state.methodSummaryList)
              .map((sum) =>
                  "• ${sum.count} ${context.tr(LocaleKeys.payment)} ${context.tr(sum.method ?? '')}: ${sum.total.toStringAsMinFixed(1)} CDF")
              .toList();
          var totalLine =
              "${context.tr(LocaleKeys.total_amount)}:  ${state.totalAmount.toStringAsMinFixed(1)} CDF";

          return Scaffold(
            appBar: AppBar(
              title: Text(context.tr(LocaleKeys.report)),
            ),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(kSizeMd),
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(kSizeMd),
                      child: Column(
                        children: [
                          Text(agentLine),
                          const Gap(kSizeSm),
                          Text(dateLine),
                          const Gap(kSizeSm),
                          const Divider(),
                          const Gap(kSizeSm),
                          Text(context.tr(LocaleKeys.report_by_vehicule)),
                          const Gap(kSizeSm),
                          if (summaryVehiculeLineList.isEmpty)
                            Text(context.tr(LocaleKeys.none)),
                          for (var sum in summaryVehiculeLineList) Text(sum),
                          const Gap(kSizeSm),
                          const Gap(kSizeSm),
                          Text(context.tr(LocaleKeys.report_by_method)),
                          const Gap(kSizeSm),
                          if (summaryMethodLineList.isEmpty)
                            Text(context.tr(LocaleKeys.none)),
                          for (var sum in summaryMethodLineList) Text(sum),
                          const Gap(kSizeSm),
                          const Divider(),
                          const Gap(kSizeSm),
                          Text(totalLine),
                        ],
                      ),
                    ),
                  ),
                  const Gap(kSizeMd),
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return FilledButton(
                          onPressed: () {
                            context.read<SettingsBloc>().add(
                                  PrintTestDataEvent(textToPrint: [
                                    (context.tr(LocaleKeys.report)),
                                    agentLine,
                                    dateLine,
                                    " ",
                                    (context.tr(LocaleKeys.report_by_vehicule)),
                                    " ",
                                    if (summaryMethodLineList.isEmpty)
                                      context.tr(LocaleKeys.none),
                                    ...summaryVehiculeLineList,
                                    " ",
                                    (context.tr(LocaleKeys.report_by_method)),
                                    " ",
                                    if (summaryMethodLineList.isEmpty)
                                      context.tr(LocaleKeys.none),
                                    ...summaryMethodLineList,
                                    " ",
                                    totalLine
                                  ], paperSize: PaperSize.mm58),
                                );
                          },
                          child: Text(context.tr(LocaleKeys.print)));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
