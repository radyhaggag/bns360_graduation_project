import 'package:bns360_graduation_project/core/providers/app_provider.dart';

import '../entities/profile/profile_entity.dart';
import '../entities/participant_entity.dart';

class ParticipantModel extends ParticipantEntity {
  const ParticipantModel({
    required super.id,
    super.nameAR,
    super.nameEN,
    super.imageUrl,
  });

  factory ParticipantModel.fromMap(Map<String, dynamic> map) {
    return ParticipantModel(
      id: map['id'] as String,
      nameEN: map['nameEN'] as String?,
      nameAR: map['nameAR'] as String?,
      imageUrl: map['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameAR': nameAR,
      'nameEN': nameEN,
      'imageUrl': imageUrl,
    };
  }

  static ParticipantEntity currentParticipant() {
    final profile = AppProvider().getProfile();
    return profile!.toParticipant();
  }
}

extension ParticipantEntityToMap on ParticipantEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameAR': nameAR,
      'nameEN': nameEN,
      'imageUrl': imageUrl,
    };
  }
}

extension ProfileEntityToParticipant on ProfileEntity {
  toParticipant() {
    return ParticipantEntity(
      id: id,
      nameEN: name,
      nameAR: name,
      imageUrl: imageUrl,
    );
  }
}
