// ignore_for_file: invalid_use_of_visible_for_testing_member, inference_failure_on_instance_creation
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/features/homepage_detail/domain/usecases/create_data_usecase.dart';
import 'package:template/features/homepage_detail/domain/usecases/get_data_usecase.dart';

part 'homepage_detail_bloc.freezed.dart';
part 'homepage_detail_event.dart';
part 'homepage_detail_state.dart';

class HomepageDetailBloc
    extends Bloc<HomepageDetailEvent, HomepageDetailState> {
  HomepageDetailBloc() : super(const HomepageDetailState.initial()) {
    on<HomepageDetailEventGetData>(_getData);
    on<HomepageDetailEventCreateData>(_createData);
  }

  Future<void> _getData(
    HomepageDetailEventGetData event,
    Emitter<HomepageDetailState> emit,
  ) async {
    final res = await sl<GetDataUseCase>().getData();
    print('saa');
  }

  Future<void> _createData(
    HomepageDetailEventCreateData event,
    Emitter<HomepageDetailState> emit,
  ) async {
    final res = await sl<CreateDataUseCase>().createData();
  }
}
