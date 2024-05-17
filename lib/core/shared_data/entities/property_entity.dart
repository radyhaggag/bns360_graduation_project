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
  final PublisherDetailsEntity publisher;
  final ContactEntity contacts;
  final OfferType type;
  final int area;
  final num price;
  final double longitude;
  final double latitude;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final DateTime timeAddedProperty;

  final bool isBelongToMe;

  const PropertyEntity({
    required this.id,
    required this.arabicDescription,
    required this.englishDescription,
    required this.arabicAddress,
    required this.englishAddress,
    required this.publisher,
    required this.contacts,
    required this.type,
    required this.area,
    required this.price,
    required this.longitude,
    required this.latitude,
    required this.timeAddedProperty,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.isBelongToMe = false,
  });

  @override
  List<Object?> get props => [id];

  List<String> get images {
    List<String> images = [];
    if (image1 != null) images.add(image1!);
    if (image2 != null) images.add(image2!);
    if (image3 != null) images.add(image3!);
    if (image4 != null) images.add(image4!);
    return images;
  }

  PropertyEntity copyWith({
    int? id,
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
    String? image1,
    String? image2,
    String? image3,
    String? image4,
    DateTime? timeAddedProperty,
    bool? isBelongToMe,
  }) {
    return PropertyEntity(
      id: id ?? this.id,
      arabicDescription: arabicDescription ?? this.arabicDescription,
      englishDescription: englishDescription ?? this.englishDescription,
      arabicAddress: arabicAddress ?? this.arabicAddress,
      englishAddress: englishAddress ?? this.englishAddress,
      publisher: publisher ?? this.publisher,
      contacts: contacts ?? this.contacts,
      type: type ?? this.type,
      area: area ?? this.area,
      price: price ?? this.price,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      image1: image1,
      image2: image2,
      image3: image3,
      image4: image4,
      timeAddedProperty: timeAddedProperty ?? this.timeAddedProperty,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
    );
  }
}
