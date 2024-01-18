import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String token;

  const SignUpEntity({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
