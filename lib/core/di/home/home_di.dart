import 'package:get_it/get_it.dart';
import 'package:template/features/homepage/data/datasource/homepage_remote_datasource.dart';
import 'package:template/features/homepage/data/repository/homepage_repository.dart';
import 'package:template/features/homepage/domain/repository/homepage_repository.dart';
import 'package:template/features/login/domain/usecases/create_data_usecase.dart';
import 'package:template/features/login/domain/usecases/get_data_usecase.dart';

void initHomeLocator(GetIt sl) {
  sl
    ..registerFactory<HomepageRemoteDataSource>(
      HomepageRemoteDataSourceImpl.new,
    )
    ..registerFactory<HomepageRepository>(HomepageRepositoryImpl.new)
    ..registerFactory<GetDataUseCase>(GetDataUseCase.new)
    ..registerFactory<CreateDataUseCase>(CreateDataUseCase.new);
}
