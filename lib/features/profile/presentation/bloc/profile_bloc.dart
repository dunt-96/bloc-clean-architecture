// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/profile/domain/usecases/create_data_usecase.dart';
import 'package:template/features/profile/domain/usecases/get_data_usecase.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.initial()) {
    on<ProfileEventGetData>(_getData);
    on<ProfileEventCreateData>(_createData);
  }

  Future<void> _getData(
    ProfileEventGetData event,
    Emitter<ProfileState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
  }

  Future<void> _createData(
    ProfileEventCreateData event,
    Emitter<ProfileState> emit,
  ) async {
    final res = await sl<CreateDataUseCase>().createData();
  }
}
