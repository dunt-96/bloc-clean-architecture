import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage_detail/domain/repository/homepage_detail_repository.dart';

class CreateDataUseCase {
  Future<void> createData() async {
    return sl<HomepageDetailRepository>().createData();
  }
}
