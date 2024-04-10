import 'package:template/features/login/domain/entities/login_entity.dart';

class LoginModel {
  LoginModel({
    this.id,
    this.name,
    this.email,
    this.isAdmin,
    this.address,
    this.avatar,
    this.phone,
    this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        isAdmin: json['isAdmin'],
        address: json['address'],
        phone: json['phone'],
        avatar: json['avatar'],
        accessToken: json['access_token'],
      );

  final String? id;
  final String? name;
  final String? email;
  final bool? isAdmin;
  final String? address;
  final String? avatar;
  final int? phone;
  final String? accessToken;

  LoginEntity toEntity() => LoginEntity(
        id: id,
        name: name,
        email: email,
        isAdmin: isAdmin,
        address: address,
        phone: phone,
        accessToken: accessToken,
      );
}
