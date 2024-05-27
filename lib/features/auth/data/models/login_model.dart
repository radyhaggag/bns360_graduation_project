import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.token,
    required super.userId,
    required super.displayName,
    required super.email,
    required super.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userId: json['id'],
      token: json['Token'],
      displayName: json['DisplayName'],
      email: json['Email'],
      role: json['Role'],
    );
  }
}
