part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.todo() = Todo;
  const factory ProfileEvent.getData() = ProfileEventGetData;
  const factory ProfileEvent.createData() = ProfileEventCreateData;
}
