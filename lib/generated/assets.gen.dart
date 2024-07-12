/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/core
  $LibCoreGen get core => const $LibCoreGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/1000fc.jpg
  AssetGenImage get a1000fc => const AssetGenImage('assets/images/1000fc.jpg');

  /// File path: assets/images/500fc.jpg
  AssetGenImage get a500fc => const AssetGenImage('assets/images/500fc.jpg');

  /// File path: assets/images/cash.png
  AssetGenImage get cash => const AssetGenImage('assets/images/cash.png');

  /// File path: assets/images/history.png
  AssetGenImage get history => const AssetGenImage('assets/images/history.png');

  /// File path: assets/images/icon-africell.png
  AssetGenImage get iconAfricell =>
      const AssetGenImage('assets/images/icon-africell.png');

  /// File path: assets/images/icon-airtel.png
  AssetGenImage get iconAirtel => const AssetGenImage('assets/images/icon-airtel.png');

  /// File path: assets/images/icon-mpesa.png
  AssetGenImage get iconMpesa => const AssetGenImage('assets/images/icon-mpesa.png');

  /// File path: assets/images/icon-orange.png
  AssetGenImage get iconOrange => const AssetGenImage('assets/images/icon-orange.png');

  /// File path: assets/images/logo_print_bw.png
  AssetGenImage get logoPrintBw => const AssetGenImage('assets/images/logo_print_bw.png');

  /// File path: assets/images/mobile_payment.png
  AssetGenImage get mobilePayment =>
      const AssetGenImage('assets/images/mobile_payment.png');

  /// File path: assets/images/report.png
  AssetGenImage get report => const AssetGenImage('assets/images/report.png');

  /// File path: assets/images/setting.png
  AssetGenImage get setting => const AssetGenImage('assets/images/setting.png');

  /// File path: assets/images/tax.png
  AssetGenImage get tax => const AssetGenImage('assets/images/tax.png');

  /// File path: assets/images/ticket.png
  AssetGenImage get ticket => const AssetGenImage('assets/images/ticket.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        a1000fc,
        a500fc,
        cash,
        history,
        iconAfricell,
        iconAirtel,
        iconMpesa,
        iconOrange,
        logoPrintBw,
        mobilePayment,
        report,
        setting,
        tax,
        ticket
      ];
}

class $AssetsLottieFileGen {
  const $AssetsLottieFileGen();

  /// File path: assets/lottieFile/cashier.json
  String get cashier => 'assets/lottieFile/cashier.json';

  /// File path: assets/lottieFile/empty.json
  String get empty => 'assets/lottieFile/empty.json';

  /// File path: assets/lottieFile/error.json
  String get error => 'assets/lottieFile/error.json';

  /// File path: assets/lottieFile/language.json
  String get language => 'assets/lottieFile/language.json';

  /// File path: assets/lottieFile/printer.json
  String get printer => 'assets/lottieFile/printer.json';

  /// File path: assets/lottieFile/success.json
  String get success => 'assets/lottieFile/success.json';

  /// File path: assets/lottieFile/theme.json
  String get theme => 'assets/lottieFile/theme.json';

  /// List of all assets
  List<String> get values => [cashier, empty, error, language, printer, success, theme];
}

class $LibCoreGen {
  const $LibCoreGen();

  /// Directory path: lib/core/config
  $LibCoreConfigGen get config => const $LibCoreConfigGen();
}

class $LibCoreConfigGen {
  const $LibCoreConfigGen();

  /// Directory path: lib/core/config/localization
  $LibCoreConfigLocalizationGen get localization => const $LibCoreConfigLocalizationGen();
}

class $LibCoreConfigLocalizationGen {
  const $LibCoreConfigLocalizationGen();

  /// File path: lib/core/config/localization/easy_localization.dart
  String get easyLocalization => 'lib/core/config/localization/easy_localization.dart';

  /// File path: lib/core/config/localization/en.json
  String get en => 'lib/core/config/localization/en.json';

  /// File path: lib/core/config/localization/fr.json
  String get fr => 'lib/core/config/localization/fr.json';

  /// List of all assets
  List<String> get values => [easyLocalization, en, fr];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieFileGen lottieFile = $AssetsLottieFileGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
