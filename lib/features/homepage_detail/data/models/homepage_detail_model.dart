import 'package:freezed_annotation/freezed_annotation.dart';
part 'homepage_detail_model.freezed.dart';
part 'homepage_detail_model.g.dart';

@freezed
class HomepageDetail with _$HomepageDetail {
  factory HomepageDetail({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String gender,
    @Default('') String image,
    @Default('') String token,
  }) = _HomepageDetail;
  factory HomepageDetail.fromJson(Map<String, Object?> json) => _$HomepageDetailFromJson(json);
}
