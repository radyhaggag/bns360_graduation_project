import 'package:equatable/equatable.dart';

class ParticipantEntity extends Equatable {
  final String id;
  final String? imageUrl;
  final String? nameAR;
  final String? nameEN;

  const ParticipantEntity({
    required this.id,
    this.imageUrl,
    this.nameAR,
    this.nameEN,
  });

  @override
  List<Object?> get props => [id, imageUrl, nameAR, nameEN];
}
