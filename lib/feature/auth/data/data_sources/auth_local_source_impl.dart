import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_collect/core/utils/shared_preference_key.dart';
import 'package:tax_collect/feature/auth/domain/entities/login_params.dart';

import 'auth_local_source.dart';

class AuthLocalSourceImpl implements AuthLocalSource {
  final SharedPreferences _preference;

  AuthLocalSourceImpl({
    required SharedPreferences preference,
  }) : _preference = preference;

  @override
  Future<bool> saveLoginData(LoginParams loginDataModel) async {
    bool saved = false;
    if (loginDataModel.username.isNotEmpty) {
      saved = await _preference.setString(
          SharedPreferenceKey.username, loginDataModel.username);
      if (saved == true) {
        _preference.setBool(SharedPreferenceKey.isLogin, true);
      }
    }
    return saved;
  }

  @override
  Future<String?> getUserData() async {
    return _preference.getString(SharedPreferenceKey.username);
  }
}
