import 'package:freezed_annotation/freezed_annotation.dart';
part 'homepage_model.freezed.dart';
part 'homepage_model.g.dart';

@freezed
class Homepage with _$Homepage {
  factory Homepage({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String gender,
    @Default('') String image,
    @Default('') String token,
  }) = _Homepage;
  factory Homepage.fromJson(Map<String, Object?> json) => _$HomepageFromJson(json);
}
