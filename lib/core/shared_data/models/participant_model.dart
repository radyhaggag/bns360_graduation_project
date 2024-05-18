import '../../providers/app_provider.dart';
import '../../utils/enums/user_type.dart';
import '../entities/participant_entity.dart';
import '../entities/profile/profile_entity.dart';

class ParticipantModel extends ParticipantEntity {
  const ParticipantModel({
    required super.id,
    required super.userType,
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
      userType: map['userType'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameAR': nameAR,
      'nameEN': nameEN,
      'imageUrl': imageUrl,
      'userType': userType,
    };
  }

  static ParticipantEntity currentParticipant() {
    final profile = AppProvider().getProfile();
    if (profile == null) {
      return ParticipantEntity(
        id: "30096242",
        userType: UserType.user.id,
      );
    }
    return profile.toParticipant();
  }
}

extension ParticipantEntityToMap on ParticipantEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameAR': nameAR,
      'nameEN': nameEN,
      'imageUrl': imageUrl,
      'userType': userType,
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
      userType: userType,
    );
  }
}
