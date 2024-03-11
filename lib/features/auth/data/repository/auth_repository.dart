import 'package:template/core/di/injection.dart';
import 'package:template/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> getData() async {
    return sl<AuthRemoteDataSource>().getData();
  }

  @override
  Future<void> createData() async {
    return sl<AuthRemoteDataSource>().createData();
  }
}
