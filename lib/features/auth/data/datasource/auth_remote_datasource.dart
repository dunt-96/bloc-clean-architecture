import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';

abstract class AuthRemoteDataSource {
  Future<void> getData();
  Future<void> createData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> getData() async {
    try {
      final res = await sl<AppHttpClient>().get('/posts/1');
      print(res);
    } catch (e) {}
  }

  @override
  Future<void> createData() async {}
}
