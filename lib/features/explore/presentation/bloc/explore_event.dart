part of 'explore_bloc.dart';

@freezed
class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.todo() = Todo;
  const factory ExploreEvent.getData() = ExploreEventGetData;
}
