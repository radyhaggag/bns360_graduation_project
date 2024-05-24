import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String userId;
  final String token;

  const LoginEntity({
    required this.userId,
    required this.token,
  });

  @override
  List<Object> get props {
    return [userId, token];
  }
}
