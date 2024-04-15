import 'package:template/core/di/injection.dart';
import 'package:template/features/explore/domain/entities/explore_entity.dart';
import 'package:template/features/explore/domain/repository/explore_repository.dart';

class GetDataUseCase {
  Future<ExploreEntity> getData() async {
    return sl<ExploreRepository>().getData();
  }
}
