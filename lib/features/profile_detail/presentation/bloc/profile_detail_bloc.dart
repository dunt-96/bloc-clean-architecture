// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/profile_detail/domain/usecases/get_data_usecase.dart';

part 'profile_detail_bloc.freezed.dart';
part 'profile_detail_event.dart';
part 'profile_detail_state.dart';


class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  ProfileDetailBloc() : super(const ProfileDetailState.initial()) {
    on<ProfileDetailEventGetData>(_getData);
  }

  Future<void> _getData(
    ProfileDetailEventGetData event,
    Emitter<ProfileDetailState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
  }
}
