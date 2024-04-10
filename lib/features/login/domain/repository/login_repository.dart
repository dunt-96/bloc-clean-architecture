import 'package:template/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> handleLogin({
    required String email,
    required String password,
  });
}
