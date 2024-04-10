class LoginEntity {
  const LoginEntity({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.isAdmin,
    this.accessToken,
  });
  final String? id;
  final String? name;
  final String? email;
  final bool? isAdmin;
  final String? address;
  final int? phone;
  final String? accessToken;
}
