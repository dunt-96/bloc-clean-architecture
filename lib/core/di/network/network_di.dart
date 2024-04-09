import 'package:dio/dio.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';

void initNetworkLocator() {
  sl.registerLazySingleton<AppHttpClient>(() => AppHttpClient(client: Dio()));
}
