import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums/user_type.dart';

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
      "DisplayName": displayName,
      "Email": email,
      "Password": password,
      "ConfirmPassword": password,
      "UserRole": userType.id,
    };
  }

  @override
  List<Object> get props => [displayName, email, password];
}
