import 'package:tax_collect/feature/auth/data/data_sources/auth_local_source.dart';
import 'package:tax_collect/feature/auth/domain/entities/login_params.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalSource _authLocalSource;

  AuthRepositoryImpl({
    required AuthLocalSource authLocalSource,
  }) : _authLocalSource = authLocalSource;

  @override
  Future<bool> saveLoginData({required LoginParams param}) async {
    return await _authLocalSource.saveLoginData(param);
  }

  @override
  Future<String?> getUserData() async{
    return await _authLocalSource.getUserData();
  }
}
