import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_detail_model.freezed.dart';
part 'profile_detail_model.g.dart';

@freezed
class ProfileDetailModel with _$ProfileDetailModel {
  factory ProfileDetailModel({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String gender,
    @Default('') String image,
    @Default('') String token,
  }) = _ProfileDetailModel;
  factory ProfileDetailModel.fromJson(Map<String, Object?> json) => _$ProfileDetailModelFromJson(json);
}
