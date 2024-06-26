import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage/data/datasource/homepage_remote_datasource.dart';
import 'package:template/features/homepage/data/repository/homepage_repository.dart';
import 'package:template/features/homepage/domain/repository/homepage_repository.dart';
import 'package:template/features/homepage/domain/usecases/create_data_usecase.dart';
import 'package:template/features/homepage/domain/usecases/get_data_usecase.dart';

void initHomeLocator() {
  sl
    ..registerFactory<HomepageRemoteDataSource>(
      HomepageRemoteDataSourceImpl.new,
    )
    ..registerFactory<HomepageRepository>(HomepageRepositoryImpl.new)
    ..registerFactory<GetDataUseCase>(GetDataUseCase.new)
    ..registerFactory<CreateDataUseCase>(CreateDataUseCase.new);
}
