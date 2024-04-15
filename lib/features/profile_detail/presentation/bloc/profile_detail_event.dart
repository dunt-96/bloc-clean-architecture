part of 'profile_detail_bloc.dart';

@freezed
class ProfileDetailEvent with _$ProfileDetailEvent {
  const factory ProfileDetailEvent.todo() = Todo;
  const factory ProfileDetailEvent.getData() = ProfileDetailEventGetData;
}
