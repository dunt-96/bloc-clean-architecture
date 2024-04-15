import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';
import 'package:template/features/explore/domain/entities/explore_entity.dart';

abstract class ExploreRemoteDataSource {
  Future<ExploreEntity> getData();
}

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  @override
  Future<ExploreEntity> getData() async {
    try {
      final res = await sl<AppHttpClient>().get('/posts/1');
      print(res);
      throw UnimplementedError();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
