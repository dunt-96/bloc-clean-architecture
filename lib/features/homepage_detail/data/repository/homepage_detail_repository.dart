import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage_detail/data/datasource/homepage_detail_remote_datasource.dart';
import 'package:template/features/homepage_detail/domain/repository/homepage_detail_repository.dart';

class HomepageDetailRepositoryImpl extends HomepageDetailRepository {
  @override
  Future<void> getData() async {
    return sl<HomepageDetailRemoteDataSource>().getData();
  }

  @override
  Future<void> createData() async {
    return sl<HomepageDetailRemoteDataSource>().createData();
  }
}
