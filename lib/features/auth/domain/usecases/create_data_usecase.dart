import 'package:template/core/di/injection.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

class CreateDataUseCase {
  Future<void> createData() async {
    return sl<AuthRepository>().createData();
  }
}
