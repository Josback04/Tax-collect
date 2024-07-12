// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryPage(),
      );
    },
    InitializerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitializerPage(),
      );
    },
    LanguageConfigRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LanguageConfigPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuPage(),
      );
    },
    PrinterConfigRoute.name: (routeData) {
      final args = routeData.argsAs<PrinterConfigRouteArgs>(
          orElse: () => const PrinterConfigRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrinterConfigPage(
          printerType: args.printerType,
          key: args.key,
        ),
      );
    },
    ProfileConfigRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileConfigPage(),
      );
    },
    ReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    ThemeConfigRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ThemeConfigPage(),
      );
    },
    TicketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TicketPage(),
      );
    },
  };
}

/// generated route for
/// [HistoryPage]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitializerPage]
class InitializerRoute extends PageRouteInfo<void> {
  const InitializerRoute({List<PageRouteInfo>? children})
      : super(
          InitializerRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitializerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LanguageConfigPage]
class LanguageConfigRoute extends PageRouteInfo<void> {
  const LanguageConfigRoute({List<PageRouteInfo>? children})
      : super(
          LanguageConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageConfigRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuPage]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrinterConfigPage]
class PrinterConfigRoute extends PageRouteInfo<PrinterConfigRouteArgs> {
  PrinterConfigRoute({
    PrinterType? printerType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PrinterConfigRoute.name,
          args: PrinterConfigRouteArgs(
            printerType: printerType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PrinterConfigRoute';

  static const PageInfo<PrinterConfigRouteArgs> page =
      PageInfo<PrinterConfigRouteArgs>(name);
}

class PrinterConfigRouteArgs {
  const PrinterConfigRouteArgs({
    this.printerType,
    this.key,
  });

  final PrinterType? printerType;

  final Key? key;

  @override
  String toString() {
    return 'PrinterConfigRouteArgs{printerType: $printerType, key: $key}';
  }
}

/// generated route for
/// [ProfileConfigPage]
class ProfileConfigRoute extends PageRouteInfo<void> {
  const ProfileConfigRoute({List<PageRouteInfo>? children})
      : super(
          ProfileConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileConfigRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportPage]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute({List<PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ThemeConfigPage]
class ThemeConfigRoute extends PageRouteInfo<void> {
  const ThemeConfigRoute({List<PageRouteInfo>? children})
      : super(
          ThemeConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeConfigRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TicketPage]
class TicketRoute extends PageRouteInfo<void> {
  const TicketRoute({List<PageRouteInfo>? children})
      : super(
          TicketRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
