import 'package:tax_collect/feature/auth/domain/entities/login_params.dart';

abstract class AuthRepository {
  Future<bool> saveLoginData({
    required LoginParams param,
  });

  Future<String?> getUserData();
}
