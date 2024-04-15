import 'package:template/core/di/injection.dart';
import 'package:template/features/profile_detail/data/datasource/profile_detail_remote_datasource.dart';
import 'package:template/features/profile_detail/domain/entities/profile_detail_entity.dart';
import 'package:template/features/profile_detail/domain/repository/profile_detail_repository.dart';

class ProfileDetailRepositoryImpl extends ProfileDetailRepository {
  @override
  Future<ProfileDetailEntity> getData() async {
    return sl<ProfileDetailRemoteDataSource>().getData();
  }
}
