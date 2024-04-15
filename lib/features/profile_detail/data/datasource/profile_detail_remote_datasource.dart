import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';
import 'package:template/features/profile_detail/domain/entities/profile_detail_entity.dart';

abstract class ProfileDetailRemoteDataSource {
  Future<ProfileDetailEntity> getData();
}

class ProfileDetailRemoteDataSourceImpl implements ProfileDetailRemoteDataSource {
  @override
  Future<ProfileDetailEntity> getData() async {
    try {
      final res = await sl<AppHttpClient>().get('/posts/1');
      print(res);
      throw UnimplementedError();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
