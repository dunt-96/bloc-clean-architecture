import 'package:template/core/di/injection.dart';
import 'package:template/features/profile_detail/domain/entities/profile_detail_entity.dart';
import 'package:template/features/profile_detail/domain/repository/profile_detail_repository.dart';

class GetDataUseCase {
  Future<ProfileDetailEntity> getData() async {
    return sl<ProfileDetailRepository>().getData();
  }
}
