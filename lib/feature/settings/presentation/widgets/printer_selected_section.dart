import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/widgets/scroll_text.dart';
import 'package:tax_collect/core/widgets/text_divider.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';
import 'package:thermal_printer/esc_pos_utils_platform/src/enums.dart';

import '../bloc/settings_bloc.dart';

class PrinterSelectedSection extends StatelessWidget {
  const PrinterSelectedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(kSizeSm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextDivider(
                  text: LocaleKeys.printer_selected.tr(),
                ),
                Card(
                  child: ListTile(
                    leading: state.selectedPrinterDevice != null
                        ? CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: IconButton(
                              color: Theme.of(context).colorScheme.onPrimary,
                              onPressed: () => {
                                context.read<SettingsBloc>().add(
                                      PrintTestDataEvent(
                                        textToPrint: const [
                                          'textToPrint',
                                          'test'
                                        ],
                                        paperSize:
                                            state.paperSize ?? PaperSize.mm58,
                                      ),
                                    )
                              },
                              icon: const Icon(Icons.print),
                            ),
                          )
                        : null,
                    title: ScrollText(
                      state.selectedPrinterDevice?.deviceName ??
                          state.selectedPrinterDevice?.address ??
                          context.tr(LocaleKeys.no_printer),
                      textAlign: state.selectedPrinterDevice == null
                          ? TextAlign.center
                          : null,
                    ),
                    subtitle: state.selectedPrinterDevice != null
                        ? Text(state.selectedPrinterDevice?.address ??
                            state.selectedPrinterDevice?.port ??
                            '')
                        : null,
                    trailing: state.selectedPrinterDevice != null
                        ? CircleAvatar(
                            backgroundColor: Colors.red,
                            child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  final device = state.selectedPrinterDevice;
                                  if (device != null) {
                                    context.read<SettingsBloc>().add(
                                        DisconnectPrinterDeviceEvent(
                                            printerDeviceModel: device));
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(context.tr(
                                                LocaleKeys.device_X_unselected,
                                                args: [
                                          device.deviceName ??
                                              device.address ??
                                              ''
                                        ]))));
                                  }
                                },
                                icon: const Icon(Icons.delete_forever)),
                          )
                        : null,
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
