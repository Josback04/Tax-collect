import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tax_collect/core/config/route/app_router.dart';
import 'package:tax_collect/core/config/theme/theme.dart';
import 'package:tax_collect/feature/auth/domain/use_cases/get_user_data.dart';
import 'package:tax_collect/feature/auth/domain/use_cases/save_user_data.dart';
import 'package:tax_collect/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:tax_collect/feature/history/domain/use_cases/get_payment_list.dart';
import 'package:tax_collect/feature/history/presentation/bloc/history_bloc.dart';
import 'package:tax_collect/feature/initializer/presentation/bloc/initializer_bloc.dart';
import 'package:tax_collect/feature/report/presentation/bloc/report_bloc.dart';
import 'package:tax_collect/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:tax_collect/feature/ticket/domain/use_cases/save_payment.dart';
import 'package:tax_collect/feature/ticket/presentation/bloc/ticket_bloc.dart';

class App extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const App({super.key, this.savedThemeMode});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InitializerBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            saveUserData: GetIt.I<SaveUserData>(),
            getUserData: GetIt.I<GetUserData>(),
          ),
        ),
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
        BlocProvider(
          create: (context) => TicketBloc(savePayment: GetIt.I<SavePayment>()),
        ),
        BlocProvider(
          create: (context) =>
              HistoryBloc(getPaymentList: GetIt.I<GetPaymentList>()),
        ),
        BlocProvider(
          create: (context) => ReportBloc(),
        ),
      ],
      child: AdaptiveTheme(
        light: ThemeData(
          useMaterial3: true,
          colorScheme: MaterialTheme.lightMediumContrastScheme(),
        ),
        dark: ThemeData(
          useMaterial3: true,
          colorScheme: MaterialTheme.darkMediumContrastScheme(),
        ),
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (lightTheme, darkTheme) {
          return MaterialApp.router(
            title: 'Taxe Collect',
            debugShowCheckedModeBanner: kDebugMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: appRouter.config(),
            builder: (context, widget) => ResponsiveBreakpoints.builder(
              child: widget!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
          );
        },
      ),
    );
  }
}
