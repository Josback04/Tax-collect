import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/feature/settings/presentation/widgets/theme_card.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

class ThemeSetting extends StatefulWidget {
  const ThemeSetting({super.key});

  @override
  State<ThemeSetting> createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: maxWidthConstraints,
      child: Column(
        children: [
          Text(LocaleKeys.select_theme.tr(), textAlign: TextAlign.center),
          Card(
            elevation:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system
                    ? null
                    : elevationDeactivated,
            child: ListTile(
              leading: const Icon(Icons.brightness_auto),
              title: Text(LocaleKeys.theme_select_system.tr()),
              subtitle: Text(LocaleKeys.theme_select_system.tr()),
              trailing: Switch(
                value:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system,
                onChanged: (bool activate) async {
                  await AdaptiveTheme.getThemeMode().then((value) => {
                        if (value != null)
                          {
                            if (!value.isSystem && activate)
                              {AdaptiveTheme.of(context).setSystem()}
                            else
                              {
                                AdaptiveTheme.of(context)
                                    .toggleThemeMode(useSystem: false)
                              }
                          }
                      });
                },
              ),
            ),
          ),
          const Row(
            children: [
              Flexible(
                flex: 1,
                child: ThemeCard(
                  themeMode: AdaptiveThemeMode.light,
                ),
              ),
              Flexible(
                flex: 1,
                child: ThemeCard(
                  themeMode: AdaptiveThemeMode.dark,
                ),
              )
            ],
          ),
          const Gap(5),
        ],
      ),
    );
  }
}
