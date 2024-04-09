// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/networks/network.dart';
import 'package:template/features/homepage/data/datasource/homepage_remote_datasource.dart';
import 'package:template/features/homepage/data/repository/homepage_repository.dart';
import 'package:template/features/homepage/domain/repository/homepage_repository.dart';
import 'package:template/features/homepage/domain/usecases/create_data_usecase.dart';
import 'package:template/features/homepage/domain/usecases/get_data_usecase.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // initNetworkLocator();
  // initHomeLocator();
  sl
    ..registerLazySingleton<AppHttpClient>(() => AppHttpClient(client: Dio()))
    ..registerFactory<HomepageRemoteDataSource>(
      HomepageRemoteDataSourceImpl.new,
    )
    ..registerFactory<HomepageRepository>(HomepageRepositoryImpl.new)
    ..registerFactory<GetDataUseCase>(GetDataUseCase.new)
    ..registerFactory<CreateDataUseCase>(CreateDataUseCase.new);
}
