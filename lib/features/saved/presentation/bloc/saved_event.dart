part of 'saved_bloc.dart';

@freezed
class SavedEvent with _$SavedEvent {
  const factory SavedEvent.todo() = Todo;
  const factory SavedEvent.getData() = SavedEventGetData;
}
