import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

class ThemeCard extends StatelessWidget {
  final AdaptiveThemeMode themeMode;

  const ThemeCard({
    super.key,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AdaptiveTheme.of(context).mode == themeMode
          ? null
          : elevationDeactivated,
      child: GestureDetector(
        onTap: () {
          if (themeMode == AdaptiveThemeMode.light) {
            AdaptiveTheme.of(context).setLight();
          }
          if (themeMode == AdaptiveThemeMode.dark) {
            AdaptiveTheme.of(context).setDark();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(kSizeSm),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Icon(
                themeMode == AdaptiveThemeMode.light
                    ? Icons.brightness_high
                    : Icons.brightness_4_rounded,
                size: kSizeXXLg,
                color: themeMode == AdaptiveThemeMode.light
                    ? Colors.orange
                    : Colors.blueGrey,
              ),
              Text(
                themeMode == AdaptiveThemeMode.light
                    ? LocaleKeys.theme_select_light.tr()
                    : LocaleKeys.theme_select_dark.tr(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
