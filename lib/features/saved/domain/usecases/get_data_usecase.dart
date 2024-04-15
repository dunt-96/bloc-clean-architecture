import 'package:template/core/di/injection.dart';
import 'package:template/features/saved/domain/entities/saved_entity.dart';
import 'package:template/features/saved/domain/repository/saved_repository.dart';

class GetDataUseCase {
  Future<SavedEntity> getData() async {
    return sl<SavedRepository>().getData();
  }
}
