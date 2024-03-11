import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/networks/network.dart';

void initNetworkLocator(GetIt sl) {
  sl.registerLazySingleton<AppHttpClient>(() => AppHttpClient(client: Dio()));
}
