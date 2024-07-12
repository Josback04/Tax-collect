import 'package:tax_collect/core/models/no_param.dart';
import 'package:tax_collect/core/usecase/usecase_future.dart';
import 'package:tax_collect/feature/auth/domain/repositories/auth_repository.dart';

class GetUserData extends UseCase<String?, NoParams> {
  final AuthRepository authRepository;

  GetUserData({required this.authRepository});

  @override
  Future<String?> call(NoParams params) async {
    return await authRepository.getUserData();
  }
}
