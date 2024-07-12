import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool visible;
  final Color color;
  final Icon icon;

  const ActionButton({
    super.key,
    required this.title,
    required this.onTap,
    this.visible = true,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: SizedBox(
        width: 300,
        height: 60,
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: icon,
          label: AutoSizeText(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}