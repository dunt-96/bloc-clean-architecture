import 'package:template/core/di/injection.dart';
import 'package:template/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:template/features/dashboard/data/datasource/dashboard_remote_datasource.dart';
import 'package:template/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  @override
  Future<DashboardEntity> getData() async {
    return sl<DashboardRemoteDataSource>().getData();
  }
}
