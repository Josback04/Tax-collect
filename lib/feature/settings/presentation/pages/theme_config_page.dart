import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';
import 'package:tax_collect/generated/assets.gen.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../widgets/theme_setting.dart';

@RoutePage()
class ThemeConfigPage extends StatelessWidget {
  const ThemeConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.theme)),
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
                  // Assets.lottieFile.theme.lottie(height: 100),
                  Icon(Icons.brightness_4_outlined, size: 100),
                  Gap(kSizeLg),
                  ThemeSetting(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
