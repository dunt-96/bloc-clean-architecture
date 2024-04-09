import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/core/observer/bloc_observer.dart';
import 'package:template/main/env/app_env.dart';

import '../app.dart';

Future<void> setUpAndRunApp({
  required AppEnvironment env,
}) async {
  await runZonedGuarded(
    () async {
      // WidgetsFlutterBinding.ensureInitialized();
      EnvInfo.initialize(env);
      await _setPreferredOrientations();
      Bloc.observer = SimpleBlocDelegate();
      await _setUpNetwork();
      await setupLocator();

      return runApp(
        const App(),
      );
    },
    (error, stack) {
      debugPrint(stack.toString());
      debugPrint(error.toString());
    },
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

Future<void> _setPreferredOrientations() {
  WidgetsFlutterBinding.ensureInitialized();
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

Future<void> _setUpNetwork() async {
  /// Hàm xử lý logout khi refesh token không thành công
  // GraphQLApiClient.actionNotRefeshToken = method();
  // HttpHelper.actionNotRefeshToken = method();

  /// Truyền finger nếu cần
  // GraphQLApiClient.finger = Mã finger;
  // HttpHelper.finger = Mã finger;

  /// Hàm get token đển network xử dụng
  // GraphQLApiClient.funcGetToken = () async => sl<Repository>().authToken();
  // HttpHelper.funcGetToken = () async => sl<Repository>().authToken();

  /// Hàm xử lý refesh token
  // GraphQLApiClient.refeshToken = method();
  // HttpHelper.refeshToken = method();
}
