import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tax_collect/core/utils/printer_helper.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';
import 'package:thermal_printer/esc_pos_utils_platform/esc_pos_utils_platform.dart';
import 'package:thermal_printer/thermal_printer.dart';

import '../widgets/printer_device_scan_section.dart';
import '../widgets/printer_option_section.dart';
import '../widgets/printer_selected_section.dart';

@RoutePage()
class PrinterConfigPage extends StatefulWidget {
  final PrinterType? printerType;

  const PrinterConfigPage({this.printerType, super.key});

  @override
  State<PrinterConfigPage> createState() => _PrinterConfigPageState();
}

class _PrinterConfigPageState extends State<PrinterConfigPage> {
  PaperSize selectedPaperSize = PaperSize.mm58;
  late PrinterType selectedPrinterType;

  Logger logger = GetIt.I<Logger>();

  @override
  void initState() {
    selectedPrinterType =
        widget.printerType ?? PrinterHelper.getDefaultPrinterType();

    context.read<SettingsBloc>().add(ConfigPrinterDeviceOptionEvent(
        printerType: selectedPrinterType, paperSize: selectedPaperSize));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isSmallScreen =
        ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          context.tr(LocaleKeys.configure_printer),
          maxLines: 1,
        ),
        actions: [
          if (isSmallScreen)
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      context.read<SettingsBloc>().add(
                            ShowOptions(
                              show: state.showOption ? false : true,
                            ),
                          );
                    },
                    icon: Icon(state.showOption
                        ? Icons.settings
                        : Icons.settings_suggest_rounded));
              },
            )
        ],
      ),
      body: SafeArea(
        child: BlocListener<SettingsBloc, SettingsState>(
          listenWhen: (previous, current) =>
              previous.printerType != current.printerType ||
              previous.paperSize != current.paperSize ||
              previous.ble != current.ble ||
              previous.reconnect != current.reconnect,
          listener: (context, state) {
            logger.i({"scan_device"});
            context.read<SettingsBloc>().add(ScanDeviceEvent(
                selectedPrinterType: state.printerType ?? selectedPrinterType));
          },
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return LayoutBuilder(builder: (context, constraints) {
                if (isSmallScreen) {
                  return Column(
                    children: [
                      const PrinterSelectedSection(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Visibility(
                                visible: state.showOption,
                                child: PrinterOptionSection(
                                    selectedPrinterType: state.printerType),
                              ),
                              PrinterDeviceScanSection(
                                selectedPrinterType: state.printerType,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 400,
                        child: Column(
                          children: [
                            const PrinterSelectedSection(),
                            PrinterOptionSection(
                              selectedPrinterType: state.printerType,
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: PrinterDeviceScanSection(
                            selectedPrinterType: state.printerType,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
