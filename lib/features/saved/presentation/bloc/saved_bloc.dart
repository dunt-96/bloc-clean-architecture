// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/saved/domain/usecases/get_data_usecase.dart';

part 'saved_bloc.freezed.dart';
part 'saved_event.dart';
part 'saved_state.dart';


class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(const SavedState.initial()) {
    on<SavedEventGetData>(_getData);
  }

  Future<void> _getData(
    SavedEventGetData event,
    Emitter<SavedState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
  }
}
