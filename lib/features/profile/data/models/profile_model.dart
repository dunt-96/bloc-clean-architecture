import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String gender,
    @Default('') String image,
    @Default('') String token,
  }) = _Profile;
  factory Profile.fromJson(Map<String, Object?> json) => _$ProfileFromJson(json);
}
