import 'package:equatable/equatable.dart';

class ParticipantEntity extends Equatable {
  final String id;
  final String? imageUrl;
  final String name;

  const ParticipantEntity({
    required this.id,
    this.imageUrl,
    required this.name,
  });

  @override
  List<Object?> get props => [id, imageUrl, name];
}
