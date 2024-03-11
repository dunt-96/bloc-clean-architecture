import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';

abstract class HomepageRemoteDataSource {
  Future<void> getData();
  Future<void> createData();
}

class HomepageRemoteDataSourceImpl implements HomepageRemoteDataSource {
  @override
  Future<void> getData() async {
    try {
      final res = await sl<AppHttpClient>().get('/posts/1');
      print(res);
      print('hahahahah');
    } catch (e) {}
  }

  @override
  Future<void> createData() async {}
}
