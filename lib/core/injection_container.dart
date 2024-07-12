import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/feature/auth/data/data_sources/auth_local_source.dart';
import 'package:tax_collect/feature/auth/data/data_sources/auth_local_source_impl.dart';
import 'package:tax_collect/feature/auth/data/repositories/AuthRepositoryImpl.dart';
import 'package:tax_collect/feature/auth/domain/repositories/auth_repository.dart';
import 'package:tax_collect/feature/auth/domain/use_cases/save_user_data.dart';
import 'package:tax_collect/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:tax_collect/feature/history/data/data_sources/history_local_source.dart';
import 'package:tax_collect/feature/history/data/data_sources/history_local_source_impl.dart';
import 'package:tax_collect/feature/history/data/repositories/history_repository_impl.dart';
import 'package:tax_collect/feature/history/domain/repositories/history_repository.dart';
import 'package:tax_collect/feature/history/domain/use_cases/get_payment_list.dart';
import 'package:tax_collect/feature/history/presentation/bloc/history_bloc.dart';
import 'package:tax_collect/feature/initializer/presentation/bloc/initializer_bloc.dart';
import 'package:tax_collect/feature/report/presentation/bloc/report_bloc.dart';
import 'package:tax_collect/feature/settings/data/models/printer_hive_box.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/feature/ticket/data/data_sources/ticket_local_source.dart';
import 'package:tax_collect/feature/ticket/data/data_sources/ticket_local_source_impl.dart';
import 'package:tax_collect/feature/ticket/domain/repositories/ticket_repository.dart';
import 'package:tax_collect/feature/ticket/domain/use_cases/save_payment.dart';
import 'package:tax_collect/feature/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:thermal_printer/esc_pos_utils_platform/src/capability_profile.dart';
import 'package:thermal_printer/thermal_printer.dart';

import '../feature/auth/domain/use_cases/get_user_data.dart';
import '../feature/ticket/data/repositories/ticket_repository_impl.dart';
import 'data/database/app_database.dart';

///Service Locator for the App using GetIt
final sl = GetIt.instance;

Future<void> injectionContainer() async {
  //Registering configured Hive Adapter
  Hive.registerAdapter(PrinterHiveBoxAdapter());

  ///Bloc
  ///
  /// Feature - Initializer
  sl.registerFactory<InitializerBloc>(
    () => InitializerBloc(),
  );

  ///Feature - Auth
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      saveUserData: sl(),
      getUserData: sl(),
    ),
  );

  ///Feature - Setting
  sl.registerFactory<SettingsBloc>(
    () => SettingsBloc(),
  );

  ///Feature - TicketBlock
  sl.registerFactory<TicketBloc>(
    () => TicketBloc(savePayment: sl()),
  );

  ///Feature - HistoryBloc
  sl.registerFactory<HistoryBloc>(
    () => HistoryBloc(getPaymentList: sl()),
  );

  ///Feature - Report
  sl.registerFactory<ReportBloc>(
    () => ReportBloc(),
  );

  ///Use Case
  ///
  ///Feature -Auth
  sl.registerLazySingleton<SaveUserData>(
    () => SaveUserData(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton<GetUserData>(
    () => GetUserData(
      authRepository: sl(),
    ),
  );

  ///Feature - TicketBlock
  sl.registerLazySingleton<SavePayment>(
    () => SavePayment(
      sl(),
    ),
  );

  ///Feature - History
  sl.registerLazySingleton<GetPaymentList>(
    () => GetPaymentList(
      sl(),
    ),
  );

  /// Repository
  ///
  ///Feature -Auth
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authLocalSource: sl(),
    ),
  );

  ///Feature - TicketBlock
  sl.registerLazySingleton<TicketRepository>(
    () => TicketRepositoryImpl(
      localSource: sl(),
    ),
  );

  /// History
  sl.registerLazySingleton<HistoryRepository>(
    () => HistoryRepositoryImpl(
      localSource: sl(),
    ),
  );

  ///DataSource
  ///
  ///Feature -Auth
  sl.registerLazySingleton<AuthLocalSource>(
    () => AuthLocalSourceImpl(
      preference: sl(),
    ),
  );

  ///Feature -Auth
  sl.registerLazySingleton<TicketLocalSource>(
    () => TicketLocalSourceImpl(
      database: sl(),
    ),
  );

  ///Feature -Auth
  sl.registerLazySingleton<HistoryLocalSource>(
    () => HistoryLocalSourceImpl(
      database: sl(),
    ),
  );

  ///Core
  ///
  sl.registerLazySingleton<AppDatabase>(
    () => AppDatabase(),
  );

  ///External
  ///
  var preference = await SharedPreferences.getInstance();
  var packageInfo = await PackageInfo.fromPlatform();
  final boxPrinterHive = await Hive.openBox<PrinterHiveBox>(boxPrinterHiveKey);
  final printerProfile = await CapabilityProfile.load(name: 'XP-N160I');

  sl.registerLazySingleton<SharedPreferences>(() => preference);
  sl.registerLazySingleton<PackageInfo>(() => packageInfo);
  sl.registerLazySingleton<Box<PrinterHiveBox>>(() => boxPrinterHive);
  sl.registerLazySingleton<PrinterManager>(() => PrinterManager.instance);
  sl.registerLazySingleton<CapabilityProfile>(() => printerProfile);
  sl.registerLazySingleton<Logger>(() => Logger());
}
