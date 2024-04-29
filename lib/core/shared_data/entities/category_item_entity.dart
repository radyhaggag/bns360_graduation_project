import 'package:equatable/equatable.dart';

import 'contact_entity.dart';

class CategoryItemEntity extends Equatable {
  final String id;
  final String categoryId;
  final String nameAR;
  final String nameENG;
  final String aboutAR;
  final String aboutENG;
  final String profilePictureUrl;
  final double latitude;
  final double longitude;
  final String address;
  final int workStartHour;
  final int workEndHour;
  final int workingDays;
  final List<String> albumUrls;
  final List<DateTime> holidays;
  final ContactEntity contacts;

  final bool isBelongToMe;

  const CategoryItemEntity({
    required this.id,
    required this.categoryId,
    required this.nameAR,
    required this.nameENG,
    required this.aboutAR,
    required this.aboutENG,
    required this.profilePictureUrl,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.workStartHour,
    required this.workEndHour,
    required this.workingDays,
    required this.albumUrls,
    required this.holidays,
    required this.contacts,
    this.isBelongToMe = false,
  });

  CategoryItemEntity copyWith({
    String? id,
    String? categoryId,
    String? nameAR,
    String? nameENG,
    String? aboutAR,
    String? aboutENG,
    String? profilePictureUrl,
    double? latitude,
    double? longitude,
    String? address,
    int? workStartHour,
    int? workEndHour,
    int? workingDays,
    List<String>? albumUrls,
    List<DateTime>? holidays,
    ContactEntity? contacts,
    bool? isBelongToMe,
  }) {
    return CategoryItemEntity(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      nameAR: nameAR ?? this.nameAR,
      nameENG: nameENG ?? this.nameENG,
      aboutAR: aboutAR ?? this.aboutAR,
      aboutENG: aboutENG ?? this.aboutENG,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      workStartHour: workStartHour ?? this.workStartHour,
      workEndHour: workEndHour ?? this.workEndHour,
      workingDays: workingDays ?? this.workingDays,
      albumUrls: albumUrls ?? this.albumUrls,
      holidays: holidays ?? this.holidays,
      contacts: contacts ?? this.contacts,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      categoryId,
      nameAR,
      nameENG,
      aboutAR,
      aboutENG,
      profilePictureUrl,
      latitude,
      longitude,
      address,
      workStartHour,
      workEndHour,
      workingDays,
      albumUrls,
      holidays,
      contacts,
      isBelongToMe,
    ];
  }
}
