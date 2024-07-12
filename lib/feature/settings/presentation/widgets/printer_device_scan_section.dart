import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/core/utils/printer_helper.dart';
import 'package:tax_collect/core/widgets/text_divider.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';
import 'package:thermal_printer/esc_pos_utils_platform/esc_pos_utils_platform.dart';
import 'package:thermal_printer/thermal_printer.dart';

import '../../data/models/printer_device_model.dart';

class PrinterDeviceScanSection extends StatefulWidget {
  final PrinterType? selectedPrinterType;

  const PrinterDeviceScanSection({
    super.key,
    required this.selectedPrinterType,
  });

  @override
  State<PrinterDeviceScanSection> createState() =>
      _PrinterDeviceScanSectionState();
}

class _PrinterDeviceScanSectionState extends State<PrinterDeviceScanSection> {
  late PrinterType defaultPrinterType;
  late TextEditingController _ipController;
  late TextEditingController _portController;
  late String defaultPort = '9100';

  final logger = GetIt.I<Logger>();

  @override
  void initState() {
    defaultPrinterType =
        widget.selectedPrinterType ?? PrinterHelper.getDefaultPrinterType();
    _ipController = TextEditingController(text: '');
    _portController = TextEditingController(text: defaultPort);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        logger.i(state.printerDeviceModelList.length);
      },
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          List<PrinterDeviceModel> printerDeviceList =
              state.printerDeviceModelList;
          return Padding(
            padding: const EdgeInsets.all(kSizeSm),
            child: Column(
              children: [
                TextDivider(text: context.tr(LocaleKeys.devices)),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: printerDeviceList.length,
                  itemBuilder: (context, index) {
                    final device = printerDeviceList[index];
                    return ListTile(
                      title: ListTile(
                        onTap: () => selectPrinterDevice(context, device),
                        leading: const Icon(Icons.print_outlined),
                        title: AutoSizeText(
                          device.deviceName ?? device.address ?? '-',
                          maxLines: 1,
                        ),
                        subtitle: Text(device.address ?? ''),
                        trailing: IconButton(
                          icon: Icon(((state.selectedPrinterDevice != null) &&
                                  (state.printerType == PrinterType.usb
                                      ? (state.selectedPrinterDevice
                                              ?.vendorId ==
                                          device.vendorId)
                                      : (state.selectedPrinterDevice?.address ==
                                          device.address)))
                              ? Icons.check_circle
                              : Icons.circle_outlined),
                          onPressed: () => selectPrinterDevice(context, device),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 0,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
                const Gap(kSizeMd),
                Visibility(
                  visible: (state.printerType ?? defaultPrinterType) ==
                          PrinterType.network &&
                      Platform.isWindows,
                  child: TextFormField(
                    controller: _ipController,
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    decoration: InputDecoration(
                        label: Text(context.tr(LocaleKeys.ip_address)),
                        hintText: '192.168.1.10',
                        prefixIcon: const Icon(Icons.wifi),
                        border: const OutlineInputBorder()),
                  ),
                ),
                const Gap(kSizeMd),
                Visibility(
                  visible: (state.printerType ?? defaultPrinterType) ==
                          PrinterType.network &&
                      Platform.isWindows,
                  child: TextFormField(
                    controller: _portController,
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    decoration: InputDecoration(
                      label: Text(context.tr(LocaleKeys.port)),
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      hintText: '9100',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const Gap(kSizeMd),
                Visibility(
                  visible: widget.selectedPrinterType == PrinterType.network &&
                      Platform.isWindows,
                  child: FilledButton(
                    onPressed: () async {
                      if (_ipController.text.isNotEmpty) {
                        context.read<SettingsBloc>().add(
                              ConfigPrinterDeviceOptionEvent(
                                printerType:
                                    state.printerType ?? defaultPrinterType,
                                paperSize: state.paperSize ?? PaperSize.mm58,
                                ble: state.ble ?? false,
                                reconnect: state.reconnect ?? false,
                                port: _portController.text,
                                ipAddress: _ipController.text,
                              ),
                            );
                      }

                      //  _printReceiveTest();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(kSizeMd),
                      child: Text(context.tr(LocaleKeys.add_device),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
                const Gap(kSizeLg),
              ],
            ),
          );
        },
      ),
    );
  }
}

void selectPrinterDevice(BuildContext context, PrinterDeviceModel device) {
  context
      .read<SettingsBloc>()
      .add(ConnectPrinterDeviceEvent(printerDeviceModel: device));
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(context.tr(LocaleKeys.device_X_selected,
          args: [device.deviceName ?? device.address ?? '']))));
}
