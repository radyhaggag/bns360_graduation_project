import 'package:bns360_graduation_project/core/utils/enums/user_type.dart';
import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String displayName;
  final String email;
  final String password;
  final UserType userType;

  const SignUpParams({
    required this.displayName,
    required this.email,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      "displayName": displayName,
      "email": email,
      "password": password,
      "confirmPassword": password,
      "userRole": userType.id,
    };
  }

  @override
  List<Object> get props => [displayName, email, password];
}
