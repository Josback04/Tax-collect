import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:tax_collect/core/app.dart';
import 'package:tax_collect/core/setup.dart';

void main() async {
  setup(
    () async {
      return App(
        savedThemeMode: await AdaptiveTheme.getThemeMode(),
      );
    },
  );
}
