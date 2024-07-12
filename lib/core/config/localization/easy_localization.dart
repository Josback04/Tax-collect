import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeAgo;

///Translation using EasyLocalization package saved in assets
Future<EasyLocalization> easyLocalization(
    FutureOr<Widget> Function() builder) async {
  timeAgo.setLocaleMessages('fr', timeAgo.FrMessages()); //
  return EasyLocalization(
    supportedLocales: const [
      Locale('fr'),
      Locale('en'),
    ],
    path: 'lib/core/config/localization',
    fallbackLocale: const Locale('fr'),
    startLocale: const Locale('fr'),
    useOnlyLangCode: true,
    child: await builder(),
  );
}
