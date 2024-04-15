import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';
import 'package:template/features/saved/domain/entities/saved_entity.dart';

abstract class SavedRemoteDataSource {
  Future<SavedEntity> getData();
}

class SavedRemoteDataSourceImpl implements SavedRemoteDataSource {
  @override
  Future<SavedEntity> getData() async {
    try {
      final res = await sl<AppHttpClient>().get('/posts/1');
      print(res);
      throw UnimplementedError();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
