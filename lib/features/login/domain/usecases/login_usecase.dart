import 'package:template/core/di/injection.dart';
import 'package:template/features/login/domain/entities/login_entity.dart';
import 'package:template/features/login/domain/repository/login_repository.dart';

class HandleLoginUseCase {
  Future<LoginEntity> handleLoginUC({
    required String email,
    required String password,
  }) async =>
      sl<LoginRepository>().handleLogin(email: email, password: password);
}
