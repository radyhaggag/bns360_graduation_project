// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../utils/enums/offer_type.dart';
import 'profile/user_entity.dart';

class PropertyEntity extends Equatable {
  final String id;
  final UserEntity publisher;
  final num price;
  final String description;
  final String date;
  final List<String> propertyImagesUrls;
  final String address;
  final double lat;
  final double lng;
  final String area;
  final OfferType offerType;
  final String? phoneNumber;
  final String? whatsapp;
  final bool isBelongToMe;

  const PropertyEntity({
    required this.id,
    required this.description,
    required this.price,
    required this.publisher,
    required this.date,
    required this.propertyImagesUrls,
    required this.address,
    required this.lat,
    required this.lng,
    required this.area,
    required this.offerType,
    this.phoneNumber,
    this.whatsapp,
    this.isBelongToMe = false,
  });

  @override
  List<Object> get props => [id, date, description, propertyImagesUrls];

  PropertyEntity copyWith({
    String? id,
    UserEntity? publisher,
    num? price,
    String? description,
    String? date,
    List<String>? propertyImagesUrls,
    String? address,
    double? lat,
    double? lng,
    String? area,
    OfferType? offerType,
    String? phoneNumber,
    String? whatsapp,
    bool? isBelongToMe,
  }) {
    return PropertyEntity(
      id: id ?? this.id,
      publisher: publisher ?? this.publisher,
      price: price ?? this.price,
      description: description ?? this.description,
      date: date ?? this.date,
      propertyImagesUrls: propertyImagesUrls ?? this.propertyImagesUrls,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      area: area ?? this.area,
      offerType: offerType ?? this.offerType,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsapp: whatsapp ?? this.whatsapp,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
    );
  }
}
