import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void showLoading(BuildContext context, {bool? dismissible}) {
  showDialog<void>(
    context: context,
    barrierDismissible: dismissible ?? false,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox.square(
        dimension: 100,
        child: Center(
          child: LoadingAnimationWidget.waveDots(
            color: Theme.of(context).colorScheme.primary,
            size: 60,
          ),
        ),
      ),
    ),
  );
}
