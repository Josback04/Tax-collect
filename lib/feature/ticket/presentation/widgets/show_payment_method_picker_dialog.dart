import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/data/database/table/payment_table.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/widgets/show_responsive_dialog.dart';
import 'package:tax_collect/feature/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:tax_collect/feature/ticket/presentation/widgets/cash_payment_widget.dart';
import 'package:tax_collect/feature/ticket/presentation/widgets/mobile_payment_widget.dart';
import 'package:tax_collect/generated/assets.gen.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import 'card_method_picker_widget.dart';

Future<void> showPaymentMethodPickerDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.tr(LocaleKeys.pick_method_payment)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardMethodPickerWidget(
                      imageAssetName: Assets.images.cash.path,
                      title: context.tr(LocaleKeys.cash),
                      onTap: () {
                        context.router.maybePopTop().whenComplete(
                              () => showDialog(
                                context: context,
                                useSafeArea: false,
                                barrierDismissible: false,
                                builder: (builder) =>
                                    const ShowResponsiveDialog(
                                  CashPaymentWidget(),
                                ),
                              ),
                            );
                      }),
                  // CardMethodPickerWidget(
                  //   imageAssetName: Assets.images.mobilePayment.path,
                  //   title: context.tr(LocaleKeys.mobile_payment),
                  //   onTap: () {
                  //     context.router.maybePopTop().whenComplete(
                  //           () => showDialog(
                  //             context: context,
                  //             useSafeArea: false,
                  //             barrierDismissible: false,
                  //             builder: (builder) => const ShowResponsiveDialog(
                  //               MobilePaymentWidget(),
                  //             ),
                  //           ),
                  //         );
                  //   },
                  // ),
                ],
              ),
              const Gap(kSizeSm),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            OutlinedButton(
              onPressed: () => context.maybePop(),
              child: Text(context.tr(LocaleKeys.close)),
            ),
          ],
        );
      });
}
