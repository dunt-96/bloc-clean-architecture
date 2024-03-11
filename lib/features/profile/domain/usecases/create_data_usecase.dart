import 'package:template/core/di/injection.dart';
import 'package:template/features/profile/domain/repository/profile_repository.dart';

class CreateDataUseCase {
  Future<void> createData() async {
    return sl<ProfileRepository>().createData();
  }
}
