import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:gap/gap.dart';
import 'package:tax_collect/core/utils/constants.dart';

class ScrollText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? height;
  final TextAlign? textAlign;

  const ScrollText(this.text,
      {this.style, this.height, this.textAlign, super.key});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 11,
      style: style,
      maxLines: 1,
      textAlign: textAlign,
      overflowReplacement: SizedBox(
        height: height ?? ((style?.fontSize ?? 11) * 1.7),
        child: InfiniteMarquee(
          itemBuilder: (BuildContext context, int index) {
            return Text(
              text,
              style: style,
            );
          },
          separatorBuilder: (context, ind) {
            return const Gap(kSizeMd);
          },
        ),
      ),
    );
  }
}
