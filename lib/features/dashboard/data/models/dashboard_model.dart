import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  factory DashboardModel({
    @Default(0) int id,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String gender,
    @Default('') String image,
    @Default('') String token,
  }) = _DashboardModel;
  factory DashboardModel.fromJson(Map<String, Object?> json) => _$DashboardModelFromJson(json);
}
