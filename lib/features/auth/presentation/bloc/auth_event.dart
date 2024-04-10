part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStart() = AuthAppStartEvent;
  const factory AuthEvent.loggedIn({
    String? token,
    LoginEntity? loginEntity,
  }) = AuthLoggedInEvent;
  const factory AuthEvent.loggedOut() = AuthLoggedOutEvent;
}
