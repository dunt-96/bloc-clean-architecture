import 'package:template/features/profile_detail/domain/entities/profile_detail_entity.dart';

abstract class ProfileDetailRepository {
  Future<ProfileDetailEntity> getData();
}