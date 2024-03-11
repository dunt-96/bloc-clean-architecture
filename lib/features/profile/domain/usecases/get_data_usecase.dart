import 'package:template/core/di/injection.dart';
import 'package:template/features/profile/domain/repository/profile_repository.dart';

class GetDataUseCase {
  Future<void> getData() async {
    return sl<ProfileRepository>().getData();
  }
}
