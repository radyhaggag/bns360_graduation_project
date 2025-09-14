import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  final String email;
  final String newPassword;

  const ResetPasswordParams({
    required this.email,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": newPassword,
      "confirmPassword": newPassword,
    };
  }

  @override
  List<Object> get props => [email, newPassword];
}
