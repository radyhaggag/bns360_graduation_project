// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';

class AddPropertyParams {
  final String description;
  final String address;
  final double? lat;
  final double? lng;
  final OfferType offerType;
  final double price;
  final double area;
  final String phoneNumber;
  final String whatsapp;
  final List<File>? images;

  AddPropertyParams({
    required this.description,
    required this.address,
    this.lat,
    this.lng,
    required this.offerType,
    required this.price,
    required this.area,
    required this.phoneNumber,
    required this.whatsapp,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'address': address,
      'lat': lat,
      'lng': lng,
      'offerType': offerType.id,
      'price': price,
      'area': area,
      'phoneNumber': phoneNumber,
      'whatsapp': whatsapp,
    };
  }

  AddPropertyParams copyWith(
      {String? description,
      String? address,
      double? lat,
      double? lng,
      OfferType? offerType,
      double? price,
      double? area,
      String? phoneNumber,
      String? whatsapp,
      List<File>? images}) {
    return AddPropertyParams(
      description: description ?? this.description,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      offerType: offerType ?? this.offerType,
      price: price ?? this.price,
      area: area ?? this.area,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsapp: whatsapp ?? this.whatsapp,
      images: images ?? this.images,
    );
  }

  String? get image1 {
    if (images == null) return null;
    return images!.isNotEmpty ? images![0].path : null;
  }

  String? get image2 {
    if (images == null) return null;
    if (images!.length < 2) return null;
    return images!.isNotEmpty ? images![1].path : null;
  }

  String? get image3 {
    if (images == null) return null;
    if (images!.length < 3) return null;
    return images!.isNotEmpty ? images![2].path : null;
  }

  String? get image4 {
    if (images == null) return null;
    if (images!.length < 4) return null;
    return images!.isNotEmpty ? images![3].path : null;
  }
}
