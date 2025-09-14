import 'package:bns360_graduation_project/core/utils/enums/user_type.dart';
import 'package:equatable/equatable.dart';

class ParticipantEntity extends Equatable {
  final String id;
  final String? imageUrl;
  final String? nameAR;
  final String? nameEN;
  final int userType;

  const ParticipantEntity({
    required this.id,
    this.imageUrl,
    this.nameAR,
    this.nameEN,
    required this.userType,
  });

  String get modifiedId {
    if (userType == UserType.admin.id) {
      return 'admin$id';
    } else if (userType == UserType.businessOwner.id) {
      return 'business$id';
    } else if (userType == UserType.serviceProvider.id) {
      return 'craftsman$id';
    } else {
      return id;
    }
  }

  @override
  List<Object?> get props => [id, imageUrl, nameAR, nameEN];
}
