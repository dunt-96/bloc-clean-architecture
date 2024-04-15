import 'package:template/core/di/injection.dart';
import 'package:template/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:template/features/dashboard/domain/repository/dashboard_repository.dart';

class GetDataUseCase {
  Future<DashboardEntity> getData() async {
    return sl<DashboardRepository>().getData();
  }
}
