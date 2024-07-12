import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';


class TextDivider extends StatelessWidget {
  final String? text;

  final bool? centerText;

  const TextDivider({
    this.text,
    this.centerText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSizeXs),
      child: Row(
        children: [
          Visibility(
            visible: centerText == true,
            child: const Expanded(child: Divider()),
          ),
          Visibility(
            visible: centerText == true,
            child: const Gap(5),
          ),
          text != null
              ? Text(
                  text ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              : const SizedBox(),
          const Gap(5),
          const Expanded(child: Divider())
        ],
      ),
    );
  }
}
