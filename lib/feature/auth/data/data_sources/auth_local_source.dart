import 'package:tax_collect/feature/auth/domain/entities/login_params.dart';

abstract class AuthLocalSource {
  Future<bool> saveLoginData(LoginParams loginDataModel);

  Future<String?> getUserData();
}
