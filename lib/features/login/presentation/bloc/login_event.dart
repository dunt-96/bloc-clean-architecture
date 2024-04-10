part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.handleLogin({
    required String email,
    required String password,
  }) = HandleLogin;
}
