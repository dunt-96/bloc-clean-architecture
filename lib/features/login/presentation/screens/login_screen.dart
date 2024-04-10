import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/login/presentation/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Login screen'),
          onPressed: () => BlocProvider.of<LoginBloc>(context).add(
            const LoginEvent.handleLogin(
              email: 'a@gmail.com',
              password: '123',
            ),
          ),
        ),
      ),
    );
  }
}
