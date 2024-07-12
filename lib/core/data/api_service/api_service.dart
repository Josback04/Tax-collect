import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_collect/core/utils/shared_preference_key.dart';


String _batela = "https://www.batela.app/";
String _batelaPay = "https://pay.batela.app/";
String baseUrl = _batelaPay;

String getApiServiceUrl() {
  return GetIt.I<SharedPreferences>().getString(
    SharedPreferenceKey.defaultBaseUrlPrefKey,
  ) ??
      baseUrl;
}

