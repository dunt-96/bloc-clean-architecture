// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/auth/domain/usecases/create_data_usecase.dart';
import 'package:template/features/auth/domain/usecases/get_data_usecase.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<AuthAppStartEvent>(_onAuthAppStart);
    on<AuthLoggedInEvent>(_onAuthLoggedIn);
    on<AuthLoggedOutEvent>(_onAuthLoggedOut);
  }

  Future<void> _onAuthAppStart(
    AuthAppStartEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
  }

  Future<void> _onAuthLoggedIn(
    AuthLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await sl<CreateDataUseCase>().createData();
  }

  Future<void> _onAuthLoggedOut(
    AuthLoggedOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await sl<CreateDataUseCase>().createData();
  }
}
