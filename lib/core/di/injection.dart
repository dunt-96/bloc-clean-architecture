// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/local_storage/secure_storage/secure_storage.dart';
import 'package:template/core/networks/network.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/homepage/data/datasource/homepage_remote_datasource.dart';
import 'package:template/features/homepage/data/repository/homepage_repository.dart';
import 'package:template/features/homepage/domain/repository/homepage_repository.dart';
import 'package:template/features/homepage/domain/usecases/create_data_usecase.dart';
import 'package:template/features/homepage/domain/usecases/get_data_usecase.dart';
import 'package:template/features/login/data/datasource/login_remote_datasource.dart';
import 'package:template/features/login/data/repository/login_repository.dart';
import 'package:template/features/login/domain/repository/login_repository.dart';
import 'package:template/features/login/domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // initNetworkLocator();
  // initHomeLocator();
  sl
    ..registerLazySingleton<AppHttpClient>(() => AppHttpClient(client: Dio()))
    ..registerLazySingleton<SecureStoragesManager>(
      () => SecureStoragesManager(
        secureStorage: const FlutterSecureStorage(),
      ),
    )
    ..registerFactory<HomepageRemoteDataSource>(
      HomepageRemoteDataSourceImpl.new,
    )
    ..registerFactory<HomepageRepository>(HomepageRepositoryImpl.new)
    ..registerFactory<GetDataUseCase>(GetDataUseCase.new)
    ..registerFactory<CreateDataUseCase>(CreateDataUseCase.new)

    //login
    ..registerFactory<LoginRemoteDataSource>(
      LoginRemoteDataSourceImpl.new,
    )
    ..registerFactory<LoginRepository>(LoginRepositoryImpl.new)
    ..registerFactory<HandleLoginUseCase>(HandleLoginUseCase.new)
    ..registerLazySingleton<AuthBloc>(AuthBloc.new);
}
