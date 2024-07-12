import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tax_collect/core/injection_container.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/localization/easy_localization.dart';

Future<void> setup(FutureOr<Widget> Function() builder) async {
  ///Error Logging
  FlutterError.onError = (details) {
    Logger().e(details.exceptionAsString(), stackTrace: details.stack);
  };

  if (kDebugMode) Bloc.observer = const AppBlocObserver();

  ///cross-flavor configuration here
  WidgetsFlutterBinding.ensureInitialized();

  ///Bloc Hydrate
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  ///init EasyLocalization
  EasyLocalization.ensureInitialized();

  ///Hive init
  await Hive.initFlutter();

  ///App Locator with get_it
  await injectionContainer();

  ///Run App Entry
  runApp(await easyLocalization(builder));
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
