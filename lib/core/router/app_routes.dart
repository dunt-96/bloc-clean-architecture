import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/core/router/route_constants.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/auth/presentation/screens/auth_screen.dart';
import 'package:template/features/explore/presentation/screens/explore_screen.dart';
import 'package:template/features/homepage/presentation/screens/homepage_screen.dart';
import 'package:template/features/homepage_detail/presentation/screens/homepage_detail_screen.dart';
import 'package:template/features/not_found_page/not_found_page.dart';
import 'package:template/features/profile/presentation/screens/prayer_times.dart';
import 'package:template/features/profile_detail/presentation/screens/profile_detail_screen.dart';
import 'package:template/features/saved/presentation/screens/saved_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'profile');
  static final _shellNavigatorSavedKey =
      GlobalKey<NavigatorState>(debugLabel: 'saved');
  static final _shellNavigatorExploreKey =
      GlobalKey<NavigatorState>(debugLabel: 'explore');

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.homePageName,
    // debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BlocProvider<AuthBloc>(
            create: (context) =>
                sl<AuthBloc>()..add(const AuthEvent.appStart()),
            child: AuthScreen(navigationShell: navigationShell),
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: Routes.homePageName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomepageScreen(),
                ),
                routes: [
                  GoRoute(
                    path: Routes.homeDetailsNamedPage,
                    builder: (context, state) => const HomepageDetailScreen(),
                  ),
                ],
              ),
            ],
          ),
          // StatefulShellBranch(
          //   navigatorKey: _shellNavigatorProfileKey,
          //   routes: [
          //     GoRoute(
          //       path: Routes.profileNamedPage,
          //       pageBuilder: (context, state) => const NoTransitionPage(
          //         child: ProfileScreen(),
          //       ),
          //       routes: [
          //         GoRoute(
          //           path: Routes.profileDetailsNamedPage,
          //           builder: (context, state) => const ProfileDetailScreen(),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSavedKey,
            routes: [
              GoRoute(
                path: Routes.savedPageName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PrayerTime(),
                ),
                // routes: [
                //   GoRoute(
                //     path: Routes.profileDetailsNamedPage,
                //     builder: (context, state) => const ProfileDetailScreen(),
                //   ),
                // ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExploreKey,
            routes: [
              GoRoute(
                path: Routes.explorePageName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ExploreScreen(),
                ),
                // routes: [
                //   GoRoute(
                //     path: Routes.profileDetailsNamedPage,
                //     builder: (context, state) => const ProfileDetailScreen(),
                //   ),
                // ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
