import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage_detail/domain/repository/homepage_detail_repository.dart';

class GetDataUseCase {
  Future<void> getData() async {
    return sl<HomepageDetailRepository>().getData();
  }
}
