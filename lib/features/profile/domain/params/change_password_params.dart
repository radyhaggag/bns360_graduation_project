import 'package:equatable/equatable.dart';

class ChangePasswordParams extends Equatable {
  final String email;
  final String oldPassword;
  final String newPassword;

  const ChangePasswordParams({
    required this.email,
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }

  @override
  List<Object?> get props => [email, oldPassword, newPassword];
}
