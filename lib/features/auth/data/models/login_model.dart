import '../../../../core/utils/enums/user_type.dart';
import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.token,
    required super.displayName,
    required super.email,
    required super.role,
    required super.userId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userId: json['id'],
      token: json['token'],
      displayName: json['displayName'],
      email: json['email'],
      role: UserType.fromInteger(json['role']),
    );
  }
}
