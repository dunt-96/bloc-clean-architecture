part of 'homepage_detail_bloc.dart';

@freezed
class HomepageDetailEvent with _$HomepageDetailEvent {
  const factory HomepageDetailEvent.todo() = Todo;
  const factory HomepageDetailEvent.getData() = HomepageDetailEventGetData;
  const factory HomepageDetailEvent.createData() = HomepageDetailEventCreateData;
}
