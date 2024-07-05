import 'package:template/core/di/injection.dart';
import 'package:template/features/login/data/datasource/login_remote_datasource.dart';
import 'package:template/features/login/domain/entities/login_entity.dart';
import 'package:template/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginEntity> handleLogin({
    required String email,
    required String password,
  }) async {
    return sl<LoginRemoteDataSource>()
        .handleLogin(email: email, password: password);
  }
}
