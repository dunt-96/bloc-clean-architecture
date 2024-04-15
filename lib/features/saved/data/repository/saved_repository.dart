import 'package:template/core/di/injection.dart';
import 'package:template/features/saved/domain/entities/saved_entity.dart';
import 'package:template/features/saved/data/datasource/saved_remote_datasource.dart';
import 'package:template/features/saved/domain/repository/saved_repository.dart';

class SavedRepositoryImpl extends SavedRepository {
  @override
  Future<SavedEntity> getData() async {
    return sl<SavedRemoteDataSource>().getData();
  }
}
