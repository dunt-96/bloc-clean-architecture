// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/dashboard/domain/usecases/get_data_usecase.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState.initial()) {
    on<DashboardEventGetData>(_getData);
  }

  Future<void> _getData(
    DashboardEventGetData event,
    Emitter<DashboardState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
  }
}
