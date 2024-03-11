part of 'homepage_bloc.dart';

@freezed
class HomepageEvent with _$HomepageEvent {
  const factory HomepageEvent.todo() = Todo;
  const factory HomepageEvent.getData() = HomeEventGetData;
  const factory HomepageEvent.createData() = HomeEventCreateData;
}
