import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../../../../core/config/route/app_router.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.setting)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  onTap: () => context.router.push(const ProfileConfigRoute()),
                  leading: const Icon(Icons.person),
                  title: Text(
                    context.tr(LocaleKeys.profile),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(context.tr(LocaleKeys.profile_desc)),
                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () => context.router.push(PrinterConfigRoute()),
                  leading: const Icon(Icons.print),
                  title: Text(
                    context.tr(LocaleKeys.printer),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(context.tr(LocaleKeys.printer_desc)),
                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () => context.router.push(const ThemeConfigRoute()),
                  leading: const Icon(Icons.brightness_4_rounded),
                  title: Text(
                    context.tr(LocaleKeys.theme),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(context.tr(
                    LocaleKeys.select_theme,
                    args: [],
                  )),
                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () => context.router.push(const LanguageConfigRoute()),
                  leading: const Icon(Icons.language),
                  title: Text(
                    context.tr(LocaleKeys.language),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(context.tr(
                    LocaleKeys.language_desc,
                  )),
                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
