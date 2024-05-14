import 'package:equatable/equatable.dart';

import '../../utils/enums/offer_type.dart';
import 'contact_entity.dart';
import 'publisher_details_entity.dart';

class PropertyEntity extends Equatable {
  final int id;
  final String arabicDescription;
  final String englishDescription;
  final String arabicAddress;
  final String englishAddress;
  final String whatsappNumber;
  final PublisherDetailsEntity publisher;
  final ContactEntity contacts;
  final OfferType type;
  final int area;
  final num price;
  final double longitude;
  final double latitude;
  final List<String> imageNames;
  final List<String> images;
  final DateTime timeAddedProperty;

  final bool isBelongToMe;

  const PropertyEntity({
    required this.id,
    required this.arabicDescription,
    required this.englishDescription,
    required this.arabicAddress,
    required this.englishAddress,
    required this.whatsappNumber,
    required this.publisher,
    required this.contacts,
    required this.type,
    required this.area,
    required this.price,
    required this.longitude,
    required this.latitude,
    required this.imageNames,
    required this.images,
    required this.timeAddedProperty,
    this.isBelongToMe = false,
  });

  @override
  List<Object?> get props => [id];

  copyWith({
    String? arabicDescription,
    String? englishDescription,
    String? arabicAddress,
    String? englishAddress,
    String? whatsappNumber,
    PublisherDetailsEntity? publisher,
    ContactEntity? contacts,
    OfferType? type,
    int? area,
    num? price,
    double? longitude,
    double? latitude,
    List<String>? imageNames,
    List<String>? images,
    bool? isBelongToMe,
  }) {
    return PropertyEntity(
      id: id,
      arabicDescription: arabicDescription ?? this.arabicDescription,
      englishDescription: englishDescription ?? this.englishDescription,
      arabicAddress: arabicAddress ?? this.arabicAddress,
      englishAddress: englishAddress ?? this.englishAddress,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      publisher: publisher ?? this.publisher,
      contacts: contacts ?? this.contacts,
      type: type ?? this.type,
      area: area ?? this.area,
      price: price ?? this.price,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      imageNames: imageNames ?? this.imageNames,
      images: images ?? this.images,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
      timeAddedProperty: timeAddedProperty,
    );
  }
}
