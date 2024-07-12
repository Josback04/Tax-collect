import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({
    super.key,
  });

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: maxWidthConstraints,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.select_language.tr(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(kSizeMd),
            child: DropdownButtonFormField<Locale>(
              value: context.locale,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
              items: context.supportedLocales.map((Locale locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text('language_code_args.${locale.languageCode}'.tr()),
                );
              }).toList(),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  context.setLocale(newLocale);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
