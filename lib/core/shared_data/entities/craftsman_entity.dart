// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'craft_entity.dart';

class CraftsmanEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final int numOfRatings;
  final num averageRatings;
  final CraftEntity craft;
  final String descriptionAR;
  final String descriptionEN;
  final String address;
  final List<String> serviceImages;
  final bool isBelongToMe;

  const CraftsmanEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.numOfRatings,
    required this.averageRatings,
    required this.craft,
    required this.descriptionAR,
    required this.descriptionEN,
    required this.address,
    required this.serviceImages,
    this.isBelongToMe = false,
  });

  @override
  List<Object> get props => [id, craft];

  CraftsmanEntity copyWith({
    int? id,
    String? name,
    String? imageUrl,
    int? numOfRatings,
    num? averageRatings,
    CraftEntity? craft,
    String? descriptionAR,
    String? descriptionEN,
    String? address,
    List<String>? serviceImages,
    bool? isBelongToMe,
  }) {
    return CraftsmanEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      numOfRatings: numOfRatings ?? this.numOfRatings,
      averageRatings: averageRatings ?? this.averageRatings,
      craft: craft ?? this.craft,
      descriptionAR: descriptionAR ?? this.descriptionAR,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      address: address ?? this.address,
      serviceImages: serviceImages ?? this.serviceImages,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
    );
  }
}
