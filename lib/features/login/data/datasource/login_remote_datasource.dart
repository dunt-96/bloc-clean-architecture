import 'package:template/core/constant/api_constant.dart';
import 'package:template/core/di/injection.dart';
import 'package:template/core/networks/network.dart';
import 'package:template/features/login/data/models/login_model.dart';
import 'package:template/features/login/domain/entities/login_entity.dart';

abstract class LoginRemoteDataSource {
  Future<LoginEntity> handleLogin({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<LoginEntity> handleLogin({
    required String email,
    required String password,
  }) async {
    // final data1 = FormData.fromMap({'email': email, 'password': password});
    final data = {
      'email': email,
      'password': password,
    };
    final res = await sl<AppHttpClient>().post(ApiConstants.login, data: data);
    final loginEntity = LoginModel.fromJson(res.data['data']).toEntity();

    return loginEntity;
  }
}
