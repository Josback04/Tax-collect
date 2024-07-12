import 'package:flutter/material.dart';

enum SnackBarType {
  normal,
  success,
  warning,
  danger,
}

extension SnackBarTypeExtension on SnackBarType {
  bool isEqualTo(SnackBarType type) {
    return this == type;
  }
}

void showSnackBar(
  BuildContext context, {
  required String text,
  SnackBarType? type,
  bool? hideCurrentSnackBar,
}) {
  Color? color;
  switch (type) {
    case SnackBarType.danger:
      color = Colors.red;
      break;
    case SnackBarType.warning:
      color = Colors.orange;
      break;
    case SnackBarType.success:
      color = Colors.green;
      break;
    case SnackBarType.normal:
    default:
      color = null;
      break;
  }

  if (hideCurrentSnackBar ?? false) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: TextStyle(
          color: (type?.isEqualTo(SnackBarType.normal) ?? true)
              ? null
              : Colors.white),
    ),
    backgroundColor: color,
  ));
}
