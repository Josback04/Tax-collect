import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

///Utils constant file, which will determining size of it respective size

///Box Constraint of maximum size
const maxWidthConstraints = BoxConstraints(maxWidth: 600, minWidth: 200);

///Phone number length for +243 congo DRC
const int phoneNumberLenghtDRC = 9;

///Double value to make effect of deactivated button with shadow at 0.2
const double elevationDeactivated = 0.2;

///Double 4.0 : Extra small size
const kSizeXs = 4.0;

///Double 8.0 : Small size
const kSizeSm = 8.0;

///Double 16.0 : Medium size
const kSizeMd = 16.0;

///Double 24.0 : Medium extra size
const kSizeMdx = 24.0;

///Double 32.0 : Large size
const kSizeLg = 32.0;

///Double 32.0 : Extra Large size
const kSizeXLg = 40.0;

///Double 32.0 : Double Extra Large size
const kSizeXXLg = 48.0;

///Hive boxPrinter key
const String boxPrinterHiveKey = "HiveBoxPrinter";

///Constant logger for consol printing
final logger = GetIt.I<Logger>();
