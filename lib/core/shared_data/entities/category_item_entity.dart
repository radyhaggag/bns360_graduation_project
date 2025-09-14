// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/utils/enums/work_days.dart';
import 'package:equatable/equatable.dart';

import 'category_entity.dart';
import 'contact_entity.dart';
import 'review_summary_entity.dart';

class CategoryItemEntity extends Equatable {
  final int id;
  final String userId;
  final int categoriesModelId;
  final String businessNameArabic;
  final String businessNameEnglish;
  final String businessDescriptionArabic;
  final String businessDescriptionEnglish;
  final String businessAddressArabic;
  final String businessAddressEnglish;
  final int holidays;
  final ContactEntity contacts;
  final int opening;
  final int closing;
  final CategoryEntity categoriesModel;
  final String profileImageName;
  final String? businessImageName1;
  final String? businessImageName2;
  final String? businessImageName3;
  final String? businessImageName4;
  final double longitude;
  final double latitude;
  final String userName;
  final String? userImage;

  final ReviewSummaryEntity? reviewSummary; // for ui

  bool get isBelongToMe {
    return userId == AppProvider().getProfile()?.id;
  }

  const CategoryItemEntity({
    required this.userId,
    required this.id,
    required this.categoriesModelId,
    required this.businessAddressArabic,
    required this.businessAddressEnglish,
    required this.businessDescriptionArabic,
    required this.businessDescriptionEnglish,
    required this.businessNameArabic,
    required this.businessNameEnglish,
    required this.categoriesModel,
    required this.closing,
    required this.holidays,
    required this.contacts,
    required this.opening,
    required this.profileImageName,
    required this.latitude,
    required this.longitude,
    this.userImage,
    required this.userName,
    this.businessImageName1,
    this.businessImageName2,
    this.businessImageName3,
    this.businessImageName4,
    this.reviewSummary,
  });

  List<String> get businessImages {
    List<String> images = [];

    if (businessImageName1 != null) images.add(businessImageName1!);
    if (businessImageName2 != null) images.add(businessImageName2!);
    if (businessImageName3 != null) images.add(businessImageName3!);
    if (businessImageName4 != null) images.add(businessImageName4!);

    return images;
  }

  CategoryItemEntity copyWith({
    String? userId,
    int? id,
    int? categoriesModelId,
    String? businessNameArabic,
    String? businessNameEnglish,
    String? businessDescriptionArabic,
    String? businessDescriptionEnglish,
    String? businessAddressArabic,
    String? businessAddressEnglish,
    int? holidays,
    ContactEntity? contacts,
    int? opening,
    int? closing,
    CategoryEntity? categoriesModel,
    String? profileImageName,
    String? businessImageName1,
    String? businessImageName2,
    String? businessImageName3,
    String? businessImageName4,
    double? longitude,
    double? latitude,
    bool removeImages = false,
    ReviewSummaryEntity? reviewSummary,
    String? userName,
    String? userImage,
  }) {
    return CategoryItemEntity(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      categoriesModelId: categoriesModelId ?? this.categoriesModelId,
      businessNameArabic: businessNameArabic ?? this.businessNameArabic,
      businessNameEnglish: businessNameEnglish ?? this.businessNameEnglish,
      businessDescriptionArabic:
          businessDescriptionArabic ?? this.businessDescriptionArabic,
      businessDescriptionEnglish:
          businessDescriptionEnglish ?? this.businessDescriptionEnglish,
      businessAddressArabic:
          businessAddressArabic ?? this.businessAddressArabic,
      businessAddressEnglish:
          businessAddressEnglish ?? this.businessAddressEnglish,
      holidays: holidays ?? this.holidays,
      contacts: contacts ?? this.contacts,
      opening: opening ?? this.opening,
      closing: closing ?? this.closing,
      categoriesModel: categoriesModel ?? this.categoriesModel,
      profileImageName: profileImageName ?? this.profileImageName,
      businessImageName1:
          removeImages ? null : businessImageName1 ?? this.businessImageName1,
      businessImageName2:
          removeImages ? null : businessImageName2 ?? this.businessImageName2,
      businessImageName3:
          removeImages ? null : businessImageName3 ?? this.businessImageName3,
      businessImageName4:
          removeImages ? null : businessImageName4 ?? this.businessImageName4,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      reviewSummary: reviewSummary ?? this.reviewSummary,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      categoriesModelId,
      businessNameArabic,
      businessNameEnglish,
      businessDescriptionArabic,
      businessDescriptionEnglish,
      businessAddressArabic,
      businessAddressEnglish,
      holidays,
      contacts,
      opening,
      closing,
      categoriesModel,
      profileImageName,
      businessImageName1,
      businessImageName2,
      businessImageName3,
      businessImageName4,
    ];
  }

  bool get isWorking24Hour => opening == 0 && closing == 24;
  bool get _isHasNotHoliday => holidays == WorkDay.none.id;
  bool get isWorking24HourExceptHoliday => isWorking24Hour && !_isHasNotHoliday;
  bool get isAlwaysWorkingAndHasNotHolidays =>
      isWorking24Hour && _isHasNotHoliday;
}
