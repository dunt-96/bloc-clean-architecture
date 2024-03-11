import 'package:template/main/env/app_env.dart';

import 'setup.dart';

Future<void> main(List<String> args) async {
  await setUpAndRunApp(env: AppEnvironment.PROD);
}
