import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/printer_helper.dart';
import 'package:tax_collect/core/widgets/text_divider.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';
import 'package:thermal_printer/esc_pos_utils_platform/esc_pos_utils_platform.dart';
import 'package:thermal_printer/thermal_printer.dart';

import '../bloc/settings_bloc.dart';

class PrinterOptionSection extends StatefulWidget {
  final PrinterType? selectedPrinterType;

  const PrinterOptionSection({required this.selectedPrinterType, super.key});

  @override
  State<PrinterOptionSection> createState() => _PrinterOptionSectionState();
}

class _PrinterOptionSectionState extends State<PrinterOptionSection> {
  late PaperSize defaultPaperSize;
  late PrinterType defaultPrinterType;
  late bool openAccordion;

  @override
  void initState() {
    defaultPaperSize = PaperSize.mm58;
    defaultPrinterType =
        widget.selectedPrinterType ?? PrinterHelper.getDefaultPrinterType();
    context.read<SettingsBloc>().add(
          ConfigPrinterDeviceOptionEvent(
            printerType: defaultPrinterType,
            paperSize: defaultPaperSize,
            ble: false,
            reconnect: false,
          ),
        );
    super.initState();
  }

  @override
  void didChangeDependencies() {
   // openAccordion = !ResponsiveBreakpoints.of(context).isMobile;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSizeSm),
      child:

          // ResponsiveBreakpoints.of(context).isMobile
          //     ? Accordion(
          //         paddingListHorizontal: 0,
          //         contentBackgroundColor:
          //             Theme.of(context).scaffoldBackgroundColor,
          //         contentBorderColor: Theme.of(context).scaffoldBackgroundColor,
          //         headerBackgroundColor:
          //             Theme.of(context).scaffoldBackgroundColor,
          //         headerBackgroundColorOpened:
          //             Theme.of(context).scaffoldBackgroundColor,
          //         rightIcon: const Icon(Icons.arrow_drop_down_circle_sharp),
          //         children: [
          //           AccordionSection(
          //               isOpen: openAccordion,
          //               onOpenSection: () => toggle(),
          //               onCloseSection: () => toggle(),
          //               contentBackgroundColor:
          //                   Theme.of(context).scaffoldBackgroundColor,
          //               contentBorderColor:
          //                   Theme.of(context).scaffoldBackgroundColor,
          //               headerBackgroundColor:
          //                   Theme.of(context).scaffoldBackgroundColor,
          //               headerBackgroundColorOpened:
          //                   Theme.of(context).scaffoldBackgroundColor,
          //               header: TextDivider(
          //                 text: context.tr(LocaleKeys.printer_options),
          //               ),
          //               content: OptionSection(
          //                   defaultPrinterType: defaultPrinterType,
          //                   defaultPaperSize: defaultPaperSize)),
          //         ],
          //       )
          //     :

          Column(
        children: [
          TextDivider(
            text: context.tr(LocaleKeys.printer_options),
          ),
          OptionSection(
              defaultPrinterType: defaultPrinterType,
              defaultPaperSize: defaultPaperSize),
        ],
      ),
    );
  }

// toggle() {
//   setState(() {
//     openAccordion = !openAccordion;
//   });
// }
}

class OptionSection extends StatelessWidget {
  const OptionSection({
    super.key,
    required this.defaultPrinterType,
    required this.defaultPaperSize,
  });

  final PrinterType defaultPrinterType;
  final PaperSize defaultPaperSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(kSizeMd),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<PaperSize>(
                        value: state.paperSize,
                        decoration: InputDecoration(
                            labelText: context.tr(LocaleKeys.paper_size),
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder()),
                        items: [PaperSize.mm80, PaperSize.mm58]
                            .map(
                              (paperSize) => DropdownMenuItem(
                                value: paperSize,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kSizeSm),
                                  child: Text(paperSize == PaperSize.mm58
                                      ? context
                                          .tr(LocaleKeys.small_paper_printer)
                                      : context
                                          .tr(LocaleKeys.big_paper_printer)),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (paperSize) {
                          if (paperSize != null) {
                            context.read<SettingsBloc>().add(
                                  ConfigPrinterDeviceOptionEvent(
                                      printerType: state.printerType ??
                                          defaultPrinterType,
                                      paperSize: paperSize),
                                );
                          }
                        }),
                    const Gap(kSizeMd),
                    DropdownButtonFormField<PrinterType>(
                        value: state.printerType,
                        decoration: InputDecoration(
                            labelText: context.tr(LocaleKeys.printer_type),
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder()),
                        items: PrinterHelper.getPrinterTypeList()
                            .map(
                              (printerType) => DropdownMenuItem(
                                value: printerType,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kSizeSm),
                                  child: Text(context.tr(printerType.name)),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (printerType) {
                          if (printerType != null) {
                            context.read<SettingsBloc>().add(
                                  ConfigPrinterDeviceOptionEvent(
                                      printerType: printerType,
                                      paperSize:
                                          state.paperSize ?? defaultPaperSize),
                                );
                          }
                        }),
                    Visibility(
                        visible: state.printerType == PrinterType.bluetooth &&
                            Platform.isAndroid,
                        child: Column(
                          children: [
                            const Gap(kSizeMd),
                            SwitchListTile(
                              title: Text(context.tr(LocaleKeys.ble)),
                              shape: const OutlineInputBorder(),
                              value: state.ble ?? false,
                              onChanged: (bool value) {
                                context.read<SettingsBloc>().add(
                                      ConfigPrinterDeviceOptionEvent(
                                        printerType: state.printerType ??
                                            defaultPrinterType,
                                        paperSize:
                                            state.paperSize ?? defaultPaperSize,
                                        ble: value,
                                      ),
                                    );
                              },
                            ),
                          ],
                        )),
                    Visibility(
                        visible: state.printerType == PrinterType.bluetooth &&
                            Platform.isAndroid,
                        child: Column(
                          children: [
                            const Gap(kSizeMd),
                            SwitchListTile(
                              title:
                                  Text(context.tr(LocaleKeys.reconnect_device)),
                              shape: const OutlineInputBorder(),
                              value: state.reconnect ?? false,
                              onChanged: (bool value) {
                                context.read<SettingsBloc>().add(
                                      ConfigPrinterDeviceOptionEvent(
                                          printerType: state.printerType ??
                                              defaultPrinterType,
                                          paperSize: state.paperSize ??
                                              defaultPaperSize,
                                          reconnect: value),
                                    );
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
