import 'dart:io';
import 'package:thermal_printer/thermal_printer.dart';

class PrinterHelper {
  static PrinterType getDefaultPrinterType() {
    PrinterType defaultPrinterType = PrinterType.bluetooth;
    if (Platform.isAndroid || Platform.isIOS) {
      defaultPrinterType = PrinterType.bluetooth;
    } else if (Platform.isWindows) {
      defaultPrinterType = PrinterType.usb;
    } else {
      defaultPrinterType = PrinterType.network;
    }
    return defaultPrinterType;
  }

  static List<PrinterType> getPrinterTypeList() {
    List<PrinterType> list = [];
    if (Platform.isAndroid || Platform.isIOS) list.add(PrinterType.bluetooth);
    if (Platform.isAndroid || Platform.isWindows) list.add(PrinterType.usb);
    list.add(PrinterType.network);
    return list;
  }
}
