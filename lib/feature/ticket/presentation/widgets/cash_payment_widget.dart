import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tax_collect/core/config/route/app_router.dart';
import 'package:tax_collect/core/data/database/table/payment_table.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/core/utils/util.dart';
import 'package:tax_collect/core/widgets/image_cash_provider.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/feature/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:tax_collect/generated/assets.gen.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/validator/print_helper.dart';
import '../../../../generated/locale_keys.g.dart';

class CashPaymentWidget extends StatelessWidget {
  const CashPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketBloc, TicketState>(
      listener: (context, state) {
        switch (state.blocState) {
          case BlocState.success:
            var payment = state.paymentEntityResult;
            if (payment != null) {
              printTicket(context, payment);
            }
            break;
          case BlocState.initial:
          case BlocState.loading:
          case BlocState.failed:
          default:
            break;
        }
      },
      child: BlocBuilder<TicketBloc, TicketState>(
        builder: (context, state) {
          return PopScope(
            canPop: state.blocState.isInitial,
            child: SafeArea(
                child: Column(
              children: [
                const Gap(kSizeSm),
                ListTile(
                  leading: Assets.images.cash.image(height: kSizeLg),
                  title: Text(context.tr(LocaleKeys.cash_payment)),
                  trailing: state.blocState.isInitial
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => context.router.popForced(),
                        )
                      : null,
                ),
                const Divider(),
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.all(kSizeMd),
                  children: [
                    Visibility(
                        visible: state.blocState.isInitial,
                        child: Column(
                          children: [
                            imageCashProvider(state
                                        .selectedVehiculeTypeEntity?.price
                                        ?.toInt())
                                    ?.image(height: 100) ??
                                const SizedBox(),
                            const Gap(kSizeSm),
                            Text(
                              "${(state.selectedVehiculeTypeEntity?.type ?? '').toUpperCase()} ${context.tr(LocaleKeys.plate_number)}: ${state.plateNumber ?? ''}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Gap(kSizeSm),
                            FilledButton(
                                onPressed: () {
                                  context
                                      .read<TicketBloc>()
                                      .add(const MakePaymentEvent(
                                        method: Method.cash,
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(kSizeMd),
                                  child: Text(
                                      "${context.tr(LocaleKeys.pay)} ${state.selectedVehiculeTypeEntity?.price != null ? "${state.selectedVehiculeTypeEntity?.price.toStringAsMinFixed(1) ?? 0} CDF" : ""}"),
                                ))
                          ],
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(kSizeSm),
                        Visibility(
                          visible: state.blocState!.isSuccess,
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 100,
                          ),
                        ),
                        Visibility(
                          visible: state.blocState.isFailure,
                          child: const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 100,
                          ),
                        ),
                        Visibility(
                          visible: state.blocState.isInProgress,
                          child: LoadingAnimationWidget.fourRotatingDots(
                            color: Theme.of(context).colorScheme.secondary,
                            size: 100,
                          ),
                        ),
                        const Gap(kSizeSm),
                        Text(
                          context.tr(state.message ?? ''),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const Gap(kSizeMd),
                        Visibility(
                          visible: state.blocState.isSuccess,
                          child: BlocBuilder<SettingsBloc, SettingsState>(
                            builder: (context, stateSettings) {
                              return SizedBox(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (stateSettings.selectedPrinterDevice !=
                                        null) {
                                      var payment = state.paymentEntityResult;
                                      if (payment != null) {
                                        printTicket(context, payment);
                                      }
                                    } else {
                                      context.router.push(PrinterConfigRoute());
                                    }
                                  },
                                  label: Padding(
                                    padding: const EdgeInsets.all(kSizeMd),
                                    child: Text(stateSettings
                                                .selectedPrinterDevice !=
                                            null
                                        ? context.tr(LocaleKeys.print)
                                        : context
                                            .tr(LocaleKeys.configure_printer)),
                                  ),
                                  icon: const Icon(Icons.print_rounded),
                                ),
                              );
                            },
                          ),
                        ),
                        const Gap(kSizeXXLg),
                        const Divider(
                          thickness: 0.2,
                        ),
                        const Gap(kSizeSm),
                        if (!state.blocState.isInitial)
                          Visibility(
                            visible: (!state.blocState.isInProgress),
                            child: SizedBox(
                              width: 180,
                              child: OutlinedButton(
                                onPressed: () {
                                  if (state.blocState != BlocState.failed) {
                                    context
                                        .read<TicketBloc>()
                                        .add(const InitTicketEvent());
                                  }
                                  context.router.popForced();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(kSizeMd),
                                  child: Text(context.tr(LocaleKeys.done)),
                                ),
                              ),
                            ),
                          ),
                        const Gap(kSizeMd),
                      ],
                    ),
                  ],
                ))
              ],
            )),
          );
        },
      ),
    );
  }
}
