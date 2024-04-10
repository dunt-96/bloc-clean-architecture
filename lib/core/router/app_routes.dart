import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/core/router/route_constants.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/screens/auth_screen.dart';
import 'package:template/features/homepage_detail/presentation/screens/homepage_detail_screen.dart';
import 'package:template/features/not_found_page/not_found_page.dart';
import 'package:template/features/profile/presentation/screens/profile_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.authPageName,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.authPageName,
        // builder: (context, state) => BlocProvider<HomepageBloc>(
        //   create: (context) => HomepageBloc(),
        //   child: const HomepageScreen(),
        // ),
        pageBuilder: (context, state) => NoTransitionPage(
          child: BlocProvider<AuthBloc>(
            create: (context) =>
                sl<AuthBloc>()..add(const AuthEvent.appStart()),
            child: const AuthScreen(),
          ),
        ),
        routes: [
          GoRoute(
            path: Routes.homeDetailsNamedPage,
            builder: (context, state) => const HomepageDetailScreen(),
          ),
        ],
        // pageBuilder: (context, state) => BlocProvider<HomepageBloc>(
        //   create: (context) => HomepageBloc(),
        //   child: const NoTransitionPage(
        //     child: HomepageScreen(),
        //   ),
        // ),
        // routes: [
        //   GoRoute(
        //     path: Routes.homeDetailsNamedPage,
        //     builder: (context, state) => const HomeDetailsScreen(),
        //   ),
        // ],
      ),
      GoRoute(
        path: Routes.profileNamedPage,
        builder: (context, state) => const ProfileScreen(),
      ),
      // GoRoute(
      //   path: Routes.profileNamedPage,
      //   pageBuilder: (context, state) => NoTransitionPage(
      //     child: BlocProvider(
      //       create: (context) => HomepageBloc(),
      //       child: HomepageScreen(),
      //     ),
      //   ),
      //   routes: [
      //     GoRoute(
      //       path: Routes.profileDetailsNamedPage,
      //       builder: (context, state) => const ProfileDetailsScreen(),
      //     ),
      //   ],
      // ),
      // GoRoute(
      //   path: Routes.settingsNamedPage,
      //   pageBuilder: (context, state) => const NoTransitionPage(
      //     child: SettingScreen(),
      //   ),
      // ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
