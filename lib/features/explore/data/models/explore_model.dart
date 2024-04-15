import 'package:freezed_annotation/freezed_annotation.dart';
part 'explore_model.freezed.dart';
part 'explore_model.g.dart';

@freezed
class ExploreModel with _$ExploreModel {
  factory ExploreModel({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String gender,
    @Default('') String image,
    @Default('') String token,
  }) = _ExploreModel;
  factory ExploreModel.fromJson(Map<String, Object?> json) => _$ExploreModelFromJson(json);
}
