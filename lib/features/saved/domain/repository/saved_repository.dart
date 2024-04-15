import 'package:template/features/saved/domain/entities/saved_entity.dart';

abstract class SavedRepository {
  Future<SavedEntity> getData();
}