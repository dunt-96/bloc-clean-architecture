// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/explore/domain/usecases/get_data_usecase.dart';

part 'explore_bloc.freezed.dart';
part 'explore_event.dart';
part 'explore_state.dart';


class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(const ExploreState.initial()) {
    on<ExploreEventGetData>(_getData);
  }

  Future<void> _getData(
    ExploreEventGetData event,
    Emitter<ExploreState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
  }
}
