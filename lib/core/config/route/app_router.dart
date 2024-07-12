import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tax_collect/feature/auth/presentation/pages/login_page.dart';
import 'package:tax_collect/feature/history/presentation/pages/history_page.dart';
import 'package:tax_collect/feature/initializer/presentation/pages/initializer_page.dart';
import 'package:tax_collect/feature/menu/presentation/pages/menu_page.dart';
import 'package:tax_collect/feature/report/presentation/pages/report_page.dart';
import 'package:tax_collect/feature/settings/presentation/pages/language_config_page.dart';
import 'package:tax_collect/feature/settings/presentation/pages/printer_config_page.dart';
import 'package:tax_collect/feature/settings/presentation/pages/profile_config_page.dart';
import 'package:tax_collect/feature/settings/presentation/pages/settings_page.dart';
import 'package:tax_collect/feature/settings/presentation/pages/theme_config_page.dart';
import 'package:tax_collect/feature/ticket/presentation/pages/ticket_page.dart';
import 'package:thermal_printer/thermal_printer.dart';

import 'route_path.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RoutePath.init,
          page: InitializerRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: RoutePath.login,
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: RoutePath.menu,
          page: MenuRoute.page,
        ),
        AutoRoute(
          path: RoutePath.ticket,
          page: TicketRoute.page,
        ),
        AutoRoute(
          path: RoutePath.history,
          page: HistoryRoute.page,
        ),
        AutoRoute(
          path: RoutePath.report,
          page: ReportRoute.page,
        ),
        AutoRoute(
          path: RoutePath.settings,
          page: SettingsRoute.page,
        ),
        AutoRoute(
          path: RoutePath.profileConfig,
          page: ProfileConfigRoute.page,
        ),
        AutoRoute(
          path: RoutePath.printerConfig,
          page: PrinterConfigRoute.page,
        ),
        AutoRoute(
          path: RoutePath.themeConfig,
          page: ThemeConfigRoute.page,
        ),
        AutoRoute(
          path: RoutePath.languageConfig,
          page: LanguageConfigRoute.page,
        ),
      ];
}
