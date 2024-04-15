import 'package:template/core/di/injection.dart';
import 'package:template/features/explore/domain/entities/explore_entity.dart';
import 'package:template/features/explore/data/datasource/explore_remote_datasource.dart';
import 'package:template/features/explore/domain/repository/explore_repository.dart';

class ExploreRepositoryImpl extends ExploreRepository {
  @override
  Future<ExploreEntity> getData() async {
    return sl<ExploreRemoteDataSource>().getData();
  }
}
