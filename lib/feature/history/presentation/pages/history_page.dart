import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/core/utils/util.dart';
import 'package:tax_collect/core/utils/validator/print_helper.dart';
import 'package:tax_collect/core/widgets/action_button.dart';
import 'package:tax_collect/feature/history/presentation/bloc/history_bloc.dart';
import 'package:tax_collect/feature/history/presentation/bloc/history_bloc.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

@RoutePage()
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    context.read<HistoryBloc>().add(const InitHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.history)),
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              children: [
                Visibility(
                  visible: state.blocState.isInProgress,
                  child: ListTile(
                    leading: const CircularProgressIndicator(),
                    title: Text(context.tr(state.message ?? '')),
                  ),
                ),
                Visibility(
                  visible: state.blocState.isFailure,
                  child: ListTile(
                    leading: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    title: Text(context.tr(state.message ?? '')),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HistoryBloc, HistoryState>(
                    builder: (context, state) {
                      if ((state.paymentList ?? []).isEmpty) {
                        return Column(
                          children: [
                            const Gap(kSizeLg),
                            const Icon(Icons.folder_off_sharp, size: 100),
                            const Gap(kSizeMd),
                            Text(context.tr(LocaleKeys.empty_list)),
                          ],
                        );
                      } else {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (state.paymentList ?? []).length,
                            itemBuilder: (context, index) {
                              var payment = (state.paymentList ?? [])[index];
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                                context.tr(LocaleKeys.print)),
                                            content: Text(
                                              "${context.tr(LocaleKeys.bill)} #${payment.id}, "
                                              "\n${(payment.vehiculeTypeEntity?.type ?? '').toUpperCase()}"
                                              "\n${context.tr(LocaleKeys.plate_number)} : ${payment.plateNumber ?? ''}"
                                              "\n${context.tr(LocaleKeys.date)} : ${payment.createdAt.formatDdMmmYyyyHhMm(context.locale.languageCode)}"
                                              "\n${context.tr(LocaleKeys.amount_received)} ${context.tr(payment.method ?? '')} : ${payment.amount.toStringAsMinFixed(1)} CDF",
                                            ),
                                            actions: [
                                              OutlinedButton(
                                                  onPressed: () =>
                                                      context.router.maybePop(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            kSizeSm),
                                                    child: Text(context
                                                        .tr(LocaleKeys.cancel)),
                                                  )),
                                              FilledButton(
                                                  onPressed: () => printTicket(
                                                      context, payment),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            kSizeSm),
                                                    child: Text(context
                                                        .tr(LocaleKeys.print)),
                                                  )),
                                            ],
                                          );
                                        });
                                  },
                                  leading: Text(
                                      (payment.vehiculeTypeEntity?.type ?? '')
                                          .toUpperCase()),
                                  title: Text(
                                    payment.plateNumber ?? '',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  subtitle: Text(
                                      "#${payment.id}, ${context.tr(LocaleKeys.date)}: ${payment.createdAt.formatDdMmmYyyyHhMm(context.locale.languageCode)} "),
                                  trailing: Text(
                                    "${payment.amount.toStringAsMinFixed(1)} CDF\n${context.tr(payment.method ?? '')}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
