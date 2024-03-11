import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage/domain/repository/homepage_repository.dart';

class GetDataUseCase {
  Future<void> getData() {
    return sl<HomepageRepository>().getData();
  }
}
