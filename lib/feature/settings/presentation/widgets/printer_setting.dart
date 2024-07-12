import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_collect/core/config/route/app_router.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/printer_helper.dart';
import 'package:tax_collect/core/widgets/scroll_text.dart';
import 'package:thermal_printer/thermal_printer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../bloc/settings_bloc.dart';

class PrinterSetting extends StatefulWidget {
  const PrinterSetting({super.key});

  @override
  State<PrinterSetting> createState() => _PrinterSettingState();
}

class _PrinterSettingState extends State<PrinterSetting> {
  final List<PrinterType?> printerType = [null];

  @override
  void initState() {
    context.read<SettingsBloc>().add(GetSelectedPrinterSavedEvent());
    printerType.addAll(PrinterHelper.getPrinterTypeList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Container(
            constraints: maxWidthConstraints,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.select_printer_type.tr(),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(kSizeMd),
                  child: DropdownButtonFormField<PrinterType?>(
                      value: state.printerType,
                      hint: AutoSizeText(
                        context.tr(LocaleKeys.no_printer),
                        overflow: TextOverflow.ellipsis,
                      ),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      items: printerType
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: ScrollText(type != null
                                  ? context.tr(type.name)
                                  : context.tr(LocaleKeys.no_printer)),
                            ),
                          )
                          .toList(),
                      onChanged: (printerType) {
                        context
                            .read<SettingsBloc>()
                            .add(ConfigPrinterDeviceOptionEvent(
                              printerType: printerType,
                              paperSize: null,
                            ));
                      }),
                ),
                FilledButton(
                  onPressed: state.printerType == null
                      ? null
                      : () {
                          state.selectedPrinterDevice == null
                              ? context.router.popAndPush(PrinterConfigRoute(
                                  printerType: state.printerType))
                              : context.router.replace(
                                  const LoginRoute(),
                                );
                        },
                  child: Padding(
                    padding: const EdgeInsets.all(kSizeMd),
                    child: Text(context.tr(LocaleKeys.configure_printer.tr())),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
