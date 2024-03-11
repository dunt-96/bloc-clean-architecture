import 'package:template/core/di/injection.dart';
import 'package:template/features/auth/domain/repository/auth_repository.dart';

class GetDataUseCase {
  Future<void> getData() async {
    return sl<AuthRepository>().getData();
  }
}
