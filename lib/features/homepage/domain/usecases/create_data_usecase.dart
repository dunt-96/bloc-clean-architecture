import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage/domain/repository/homepage_repository.dart';

class CreateDataUseCase {
  Future<void> createData() async {
    return sl<HomepageRepository>().createData();
  }
}
