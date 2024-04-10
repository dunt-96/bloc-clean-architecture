import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:template/features/homepage/presentation/screens/homepage_screen.dart';
import 'package:template/features/login/presentation/bloc/login_bloc.dart';
import 'package:template/features/login/presentation/screens/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return BlocProvider<HomepageBloc>(
            create: (context) => HomepageBloc(),
            child: const HomepageScreen(),
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
