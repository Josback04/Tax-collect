import 'package:flutter/material.dart';
import 'package:tax_collect/core/utils/constants.dart';

class ShowResponsiveDialog extends StatelessWidget {
  final Widget widget;

  const ShowResponsiveDialog(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.sizeOf(context).width < 750;

    if (isSmallScreen) {
      return Dialog.fullscreen(
        child: widget,
      );
    } else {
      return Dialog(
        shape: isSmallScreen
            ? null
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kSizeMd)),
        child: ConstrainedBox(
          constraints: maxWidthConstraints,
          child: widget,
        ),
      );
    }
  }
}
