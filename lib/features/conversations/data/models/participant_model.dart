import '../../domain/entities/participant_entity.dart';

class ParticipantModel extends ParticipantEntity {
  const ParticipantModel({
    required super.id,
    required super.name,
    super.imageUrl,
  });

  factory ParticipantModel.fromMap(Map<String, dynamic> map) {
    return ParticipantModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  static ParticipantEntity currentParticipant() {
    const currentUserId = "";
    const currentUserImageUrl = "";
    const currentUserName = "";

    return const ParticipantEntity(
      id: currentUserId,
      name: currentUserName,
      imageUrl: currentUserImageUrl,
    );
  }
}

extension ParticipantEntityToMap on ParticipantEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
