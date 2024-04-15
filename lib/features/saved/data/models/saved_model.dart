import 'package:freezed_annotation/freezed_annotation.dart';
part 'saved_model.freezed.dart';
part 'saved_model.g.dart';

@freezed
class SavedModel with _$SavedModel {
  factory SavedModel({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String gender,
    @Default('') String image,
    @Default('') String token,
  }) = _SavedModel;
  factory SavedModel.fromJson(Map<String, Object?> json) => _$SavedModelFromJson(json);
}
