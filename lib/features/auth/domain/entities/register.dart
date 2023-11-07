import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String token;

  const Register({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
