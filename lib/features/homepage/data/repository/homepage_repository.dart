import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage/data/datasource/homepage_remote_datasource.dart';
import 'package:template/features/homepage/domain/repository/homepage_repository.dart';

class HomepageRepositoryImpl extends HomepageRepository {
  @override
  Future<void> getData() async {
    return sl<HomepageRemoteDataSource>().getData();
  }

  @override
  Future<void> createData() async {
    return sl<HomepageRemoteDataSource>().createData();
  }
}
