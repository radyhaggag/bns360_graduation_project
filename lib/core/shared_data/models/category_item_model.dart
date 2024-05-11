import 'package:bns360_graduation_project/core/shared_data/entities/contact_entity.dart';

import '../entities/category_item_entity.dart';
import 'contact_model.dart';

class CategoryItemModel extends CategoryItemEntity {
  const CategoryItemModel({
    required super.id,
    required super.categoryId,
    required super.nameAR,
    required super.nameENG,
    required super.aboutAR,
    required super.aboutENG,
    required super.profilePictureUrl,
    required super.latitude,
    required super.longitude,
    required super.address,
    required super.workStartHour,
    required super.workEndHour,
    required super.workingDays,
    required super.albumUrls,
    required super.holidays,
    required super.contacts,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
      id: json['id'],
      categoryId: json['categoryId'],
      contacts: ContactModel.fromJson(json['contacts']),
      nameAR: json['nameAR'],
      nameENG: json['nameENG'],
      aboutAR: json['aboutAR'],
      aboutENG: json['aboutENG'],
      workEndHour: json['workEndHour'],
      workStartHour: json['workStartHour'],
      workingDays: json['workingDays'],
      profilePictureUrl: json['profilePictureUrl'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      albumUrls: List<String>.from(
        json['albumUrls'].map((e) => e.toString()),
      ),
      holidays: List<DateTime>.from(
        json['holidays'].map((e) => DateTime.parse(e)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'nameAR': nameAR,
      'nameENG': nameENG,
      'aboutAR': aboutAR,
      'aboutENG': aboutENG,
      'profilePictureUrl': profilePictureUrl,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'workStartHour': workStartHour,
      'workEndHour': workEndHour,
      'workingDays': workingDays,
      'albumUrls': albumUrls,
      'holidays': holidays.map((date) => date.toIso8601String()).toList(),
      'contacts': ContactModel.fromEntity(contacts).toJson(),
    };
  }

  @override
  CategoryItemModel copyWith({
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
    return CategoryItemModel(
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
    );
  }

  factory CategoryItemModel.empty() {
    return const CategoryItemModel(
      id: '',
      categoryId: '',
      nameAR: '',
      nameENG: '',
      aboutAR: '',
      aboutENG: '',
      profilePictureUrl: '',
      latitude: 0.0,
      longitude: 0.0,
      address: '',
      workStartHour: 0,
      workEndHour: 0,
      workingDays: 0,
      albumUrls: [],
      holidays: [],
      contacts: ContactModel(),
    );
  }

  factory CategoryItemModel.fromEntity(CategoryItemEntity entity) {
    return CategoryItemModel(
      id: entity.id,
      categoryId: entity.categoryId,
      nameAR: entity.nameAR,
      nameENG: entity.nameENG,
      aboutAR: entity.aboutAR,
      aboutENG: entity.aboutENG,
      profilePictureUrl: entity.profilePictureUrl,
      latitude: entity.latitude,
      longitude: entity.longitude,
      address: entity.address,
      workStartHour: entity.workStartHour,
      workEndHour: entity.workEndHour,
      workingDays: entity.workingDays,
      albumUrls: entity.albumUrls,
      holidays: entity.holidays,
      contacts: entity.contacts,
    );
  }
}
