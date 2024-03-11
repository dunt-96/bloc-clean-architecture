import 'package:template/core/di/injection.dart';
import 'package:template/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:template/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<void> getData() async {
    return sl<ProfileRemoteDataSource>().getData();
  }

  @override
  Future<void> createData() async {
    return sl<ProfileRemoteDataSource>().createData();
  }
}
