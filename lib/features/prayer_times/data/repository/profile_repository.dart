import 'package:template/core/di/injection.dart';
import 'package:template/features/prayer_times/data/datasource/profile_remote_datasource.dart';
import 'package:template/features/prayer_times/domain/repository/profile_repository.dart';

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
