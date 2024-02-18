import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'profile_entity.g.dart';

@HiveType(typeId: 0)
class ProfileEntity extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String? imageUrl;

  ProfileEntity({
    required this.id,
    required this.email,
    required this.name,
    this.imageUrl,
  });

  ProfileEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [email, name, imageUrl];
}
