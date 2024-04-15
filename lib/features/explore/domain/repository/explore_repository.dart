import 'package:template/features/explore/domain/entities/explore_entity.dart';

abstract class ExploreRepository {
  Future<ExploreEntity> getData();
}