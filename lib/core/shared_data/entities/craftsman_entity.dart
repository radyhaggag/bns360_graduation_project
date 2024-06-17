// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/utils/enums/work_days.dart';
import 'package:equatable/equatable.dart';

import 'contact_entity.dart';
import 'craft_entity.dart';
import 'review_summary_entity.dart';

class CraftsmanEntity extends Equatable {
  final int id;
  final int craftsModelId;
  final String userId;
  final String nameAR;
  final String nameEN;
  final String descriptionAR;
  final String descriptionEN;
  final String profileImageUrl;
  final int holidays;
  final ContactEntity contact;
  final CraftEntity craft;
  final int opening;
  final int closing;
  final String addressAR;
  final String addressEN;
  final String? imageName1;
  final String? imageName2;
  final String? imageName3;
  final String? imageName4;
  final String userName;
  final String? userImage;
  final ReviewSummaryEntity? reviewSummary; // for ui

  const CraftsmanEntity({
    required this.id,
    required this.contact,
    required this.closing,
    required this.craftsModelId,
    required this.holidays,
    required this.craft,
    required this.descriptionAR,
    required this.descriptionEN,
    required this.addressAR,
    required this.addressEN,
    required this.userId,
    required this.nameAR,
    required this.nameEN,
    required this.profileImageUrl,
    required this.opening,
    required this.imageName1,
    required this.imageName2,
    required this.imageName3,
    required this.imageName4,
    required this.userName,
    this.userImage,
    this.reviewSummary,
  });

  @override
  List<Object> get props => [id, craft];

  CraftsmanEntity copyWith({
    int? id,
    int? craftsModelId,
    String? userId,
    String? nameAR,
    String? nameEN,
    String? descriptionAR,
    String? descriptionEN,
    String? profileImageUrl,
    int? holidays,
    ContactEntity? contact,
    CraftEntity? craft,
    int? opening,
    int? closing,
    String? addressAR,
    String? addressEN,
    String? imageName1,
    String? imageName2,
    String? imageName3,
    String? imageName4,
    bool? isBelongToMe,
    ReviewSummaryEntity? reviewSummary,
    bool removeImages = false,
    String? userName,
    String? userImage,
  }) {
    return CraftsmanEntity(
      id: id ?? this.id,
      craftsModelId: craftsModelId ?? this.craftsModelId,
      userId: userId ?? this.userId,
      nameAR: nameAR ?? this.nameAR,
      nameEN: nameEN ?? this.nameEN,
      descriptionAR: descriptionAR ?? this.descriptionAR,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      holidays: holidays ?? this.holidays,
      contact: contact ?? this.contact,
      craft: craft ?? this.craft,
      opening: opening ?? this.opening,
      closing: closing ?? this.closing,
      addressAR: addressAR ?? this.addressAR,
      addressEN: addressEN ?? this.addressEN,
      profileImageUrl:
          removeImages ? "" : profileImageUrl ?? this.profileImageUrl,
      imageName1: removeImages ? null : imageName1 ?? this.imageName1,
      imageName2: removeImages ? null : imageName2 ?? this.imageName2,
      imageName3: removeImages ? null : imageName3 ?? this.imageName3,
      imageName4: removeImages ? null : imageName4 ?? this.imageName4,
      reviewSummary: reviewSummary ?? this.reviewSummary,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
    );
  }

  List<String> get serviceImages {
    List<String> images = [];

    if (imageName1 != null) images.add(imageName1!);
    if (imageName2 != null) images.add(imageName2!);
    if (imageName3 != null) images.add(imageName3!);
    if (imageName4 != null) images.add(imageName4!);

    return images;
  }

  bool get isWorking24Hour => opening == 0 && closing == 24;
  bool get _isHasNotHoliday => holidays == WorkDay.none.id;
  bool get isWorking24HourExceptHoliday => isWorking24Hour && !_isHasNotHoliday;
  bool get isAlwaysWorkingAndHasNotHolidays =>
      isWorking24Hour && _isHasNotHoliday;

  bool get isBelongToMe {
    return userId == AppProvider().getProfile()?.id;
  }
}
