import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';
import 'package:template/features/dashboard/domain/entities/dashboard_entity.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardEntity> getData();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  @override
  Future<DashboardEntity> getData() async {
    try {
      final res = await sl<AppHttpClient>().get('/posts/1');
      print(res);
      const result = DashboardEntity();
      return result;
      throw UnimplementedError();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
