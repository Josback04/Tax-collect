import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/generated/assets.gen.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../widgets/language_setting.dart';

@RoutePage()
class LanguageConfigPage extends StatelessWidget {
  const LanguageConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.language)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              constraints: maxWidthConstraints,
              padding: const EdgeInsets.all(kSizeMd),
              child: const Column(
                children: [
                  Gap(kSizeLg),
                  //Assets.lottieFile.language.lottie(height: 100),
                  Icon(Icons.language, size: 100),
                  Gap(kSizeLg),
                  LanguageSetting(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
