import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String? imageUrl;
  final String? userDescriptionAR;
  final String? userDescriptionEN;
  final int userType;

  const UserEntity({
    required this.id,
    required this.name,
    required this.userType,
    required this.userDescriptionAR,
    required this.userDescriptionEN,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, userType];
}
