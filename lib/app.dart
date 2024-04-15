import 'package:flutter/material.dart';
import 'package:template/core/router/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      // routeInformationProvider: AppRouter.router.routeInformationProvider,
      // routeInformationParser: AppRouter.router.routeInformationParser,
      // routerDelegate: AppRouter.router.routerDelegate,
      title: 'Go Router',
      // routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
