import 'package:equatable/equatable.dart';

class SignUp extends Equatable {
  final String token;

  const SignUp({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
