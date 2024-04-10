// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/features/login/domain/usecases/login_usecase.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<HandleLogin>(_onHandleLogin);
  }

  Future<void> _onHandleLogin(
    HandleLogin event,
    Emitter<LoginState> emit,
  ) async {
    final res = await sl<HandleLoginUseCase>().handleLoginUC(
      email: event.email,
      password: event.password,
    );

    if ((res.accessToken ?? '').isNotEmpty) {
      sl<AuthBloc>().add(
        AuthEvent.loggedIn(token: res.accessToken, loginEntity: res),
      );
    }

    print('login model in bloc $res');
  }
}
