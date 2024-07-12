import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/card_inkwell.dart';
import '../../../../core/widgets/scroll_text.dart';

class CardMethodPickerWidget extends StatelessWidget {
  final bool? visible;
  final String imageAssetName;
  final String title;
  final VoidCallback onTap;

  const CardMethodPickerWidget({
    super.key,
    this.visible,
    required this.imageAssetName,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible ?? true,
      child: CardInkWell(
          elevation: kSizeMdx,
          onTap: onTap,
          child: SizedBox.square(
            dimension: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imageAssetName,
                  height: 50,
                ),
                const Gap(kSizeSm),
                ScrollText(title),
              ],
            ),
          )),
    );
  }
}
