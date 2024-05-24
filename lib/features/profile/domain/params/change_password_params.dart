import 'package:equatable/equatable.dart';

class ChangePasswordParams extends Equatable {
  final String userId;
  final String oldPassword;
  final String newPassword;

  const ChangePasswordParams({
    required this.userId,
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }

  @override
  List<Object?> get props => [userId, oldPassword, newPassword];
}
