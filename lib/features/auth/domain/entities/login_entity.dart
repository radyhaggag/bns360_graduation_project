import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums/user_type.dart';

class LoginEntity extends Equatable {
  final String userId;
  final String token;
  final String displayName;
  final String email;
  final UserType role;

  const LoginEntity({
    required this.userId,
    required this.token,
    required this.displayName,
    required this.email,
    required this.role,
  });

  @override
  List<Object> get props {
    return [userId, token, displayName, email, role];
  }
}
