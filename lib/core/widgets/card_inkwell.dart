import 'package:flutter/material.dart';
import 'package:tax_collect/core/utils/constants.dart';

class CardInkWell extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final void Function()? onLongPress;
  final BorderRadius borderRadius;
  final double elevation;

  const CardInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.elevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Make Material transparent
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: elevation,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(kSizeXs),
            child: child,
          ),
        ),
      ),
    );
  }
}
