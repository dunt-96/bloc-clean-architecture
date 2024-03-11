// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage/domain/usecases/create_data_usecase.dart';
import 'package:template/features/homepage/domain/usecases/get_data_usecase.dart';

part 'homepage_bloc.freezed.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageState.initial()) {
    on<HomeEventGetData>(_getData);
    on<HomeEventCreateData>(_createData);
  }

  Future<void> _getData(
    HomeEventGetData event,
    Emitter<HomepageState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
  }

  Future<void> _createData(
    HomeEventCreateData event,
    Emitter<HomepageState> emit,
  ) async {
    final res = await sl<CreateDataUseCase>().createData();
  }
}
