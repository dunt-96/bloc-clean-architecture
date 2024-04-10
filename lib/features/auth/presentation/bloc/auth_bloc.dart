// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/core/local_storage/secure_storage/secure_storage.dart';
import 'package:template/core/local_storage/secure_storage/storage_constant.dart';
import 'package:template/features/auth/domain/usecases/create_data_usecase.dart';
import 'package:template/features/login/domain/entities/login_entity.dart';

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
    final token =
        await sl<SecureStoragesManager>().getData(key: StorageConstant.token);

    if ((token ?? '').isNotEmpty) {
      return emit(const AuthState.authenticated());
    }

    emit(const AuthState.unAuthenticated());
  }

  Future<void> _onAuthLoggedIn(
    AuthLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    // await sl<CreateDataUseCase>().createData();
    if ((event.token ?? '').isNotEmpty) {
      emit(
        AuthState.authenticated(
          token: event.token!,
          loginEntity: event.loginEntity,
        ),
      );
    }
  }

  Future<void> _onAuthLoggedOut(
    AuthLoggedOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await sl<CreateDataUseCase>().createData();
  }
}
