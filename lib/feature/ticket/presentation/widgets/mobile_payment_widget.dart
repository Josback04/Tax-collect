import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tax_collect/core/config/route/app_router.dart';
import 'package:tax_collect/core/utils/state_enum.dart';
import 'package:tax_collect/core/utils/util.dart';
import 'package:tax_collect/core/utils/validator/print_helper.dart';
import 'package:tax_collect/core/widgets/image_mobile_money_provider.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/feature/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:tax_collect/generated/assets.gen.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/validator/name_validator.dart';
import '../../../../generated/locale_keys.g.dart';

class MobilePaymentWidget extends StatefulWidget {
  const MobilePaymentWidget({super.key});

  @override
  State<MobilePaymentWidget> createState() => _MobilePaymentWidgetState();
}

class _MobilePaymentWidgetState extends State<MobilePaymentWidget> {
  final formKey = GlobalKey<FormState>();

  TextEditingController textEditingControllerPhone = TextEditingController();
  FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodeSubmit = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketBloc, TicketState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.blocState.isInitial,
          child: SafeArea(
              child: Column(
            children: [
              const Gap(kSizeSm),
              ListTile(
                leading: Assets.images.mobilePayment.image(height: kSizeLg),
                title: Text(context.tr(LocaleKeys.mobile_payment)),
                trailing: state.blocState.isInitial
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => context.maybePop(),
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              focusNode: focusNodePhone,
                              controller: textEditingControllerPhone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  labelText: context.tr(LocaleKeys.phone),
                                  hintText: context.tr(LocaleKeys.phone),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: kSizeMdx, vertical: kSizeMd),
                                  prefix: const Text("+243 "),
                                  border: const OutlineInputBorder(),
                                  suffixIcon:
                                      ((state.phoneNumber ?? '').length ==
                                              phoneNumberLenghtDRC)
                                          ? const Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                            )
                                          : null),
                              textCapitalization: TextCapitalization.characters,
                              onFieldSubmitted: (_) =>
                                  focusNodeSubmit.requestFocus(),
                              validator: (value) => const NameValidator.pure()
                                  .validator(value ?? '',
                                      checkPhoneNumber: true)
                                  ?.text(context),
                              onChanged: (value) {
                                context.read<TicketBloc>().add(
                                      EnterPhoneNumberEvent(
                                        phoneNumber: value,
                                      ),
                                    );
                              },
                            ),
                            const Gap(kSizeSm),
                            SizedBox.square(
                              child: imageMobileMoneyProvider(
                                    state.phoneNumber.toString(),
                                  )?.image(height: 100) ??
                                  const SizedBox(),
                            ),
                            const Gap(kSizeMd),
                            Text(
                              "${(state.selectedVehiculeTypeEntity?.type ?? '').toUpperCase()} ${context.tr(LocaleKeys.plate_number)}: ${state.plateNumber ?? ''}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Gap(kSizeSm),
                            FilledButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(kSizeMd),
                                child: Text(
                                  "${context.tr(LocaleKeys.pay)} ${state.selectedVehiculeTypeEntity?.price != null ? "${state.selectedVehiculeTypeEntity?.price.toStringAsMinFixed(1) ?? 0} CDF" : ""}"
                                      .toUpperCase(),
                                ),
                              ),
                            ),
                            const Gap(kSizeSm),
                            Text(
                              context.tr(LocaleKeys.fees_might_be_included),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.5)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state.blocState.isInProgress,
                      child: Column(
                        children: [
                          LoadingAnimationWidget.fourRotatingDots(
                            color: Theme.of(context).colorScheme.secondary,
                            size: 100,
                          ),
                          const Gap(kSizeSm),
                          Text(
                            context.tr(state.message ?? ''),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: state.blocState.isFailure,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 100,
                          ),
                          const Gap(kSizeSm),
                          Text(
                            context.tr(state.message ?? ''),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: state.blocState.isSuccess,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 100,
                          ),
                          const Gap(kSizeSm),
                          Text(
                            context.tr(state.message ?? ''),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Gap(kSizeMd),
                          BlocBuilder<SettingsBloc, SettingsState>(
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
                          )
                        ],
                      ),
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
              )
            ],
          )),
        );
      },
    );
  }
}
