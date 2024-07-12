import 'package:tax_collect/core/usecase/usecase_future.dart';
import 'package:tax_collect/feature/auth/domain/repositories/auth_repository.dart';

import '../entities/login_params.dart';

class SaveUserData implements UseCase<bool, LoginParams> {
  final AuthRepository authRepository;

  SaveUserData({required this.authRepository});

  @override
  Future<bool> call(LoginParams params) async {
    return await authRepository.saveLoginData(param: params);
  }
}
