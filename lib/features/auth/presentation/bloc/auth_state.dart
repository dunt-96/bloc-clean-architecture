part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitialState;
  const factory AuthState.loading() = AuthLoadingState;
  const factory AuthState.authenticated({
    @Default('') String token,
    LoginEntity? loginEntity,
  }) = AuthenticatedState;
  const factory AuthState.unAuthenticated() = UnAuthenticatedState;
}
