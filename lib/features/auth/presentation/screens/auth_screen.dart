import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:template/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:template/features/login/presentation/bloc/login_bloc.dart';
import 'package:template/features/login/presentation/screens/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key, required this.navigationShell})
      : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'),
        );

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return BlocProvider<DashboardBloc>(
            create: (context) => DashboardBloc(),
            child: DashboardScreen(
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: _goBranch,
            ),
          );
        }

        return BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginScreen(),
        );
      },
    );
  }
}
