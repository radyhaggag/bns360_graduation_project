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

  const CraftsmanEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.numOfRatings,
    required this.averageRatings,
    required this.craft,
    required this.descriptionAR,
    required this.descriptionEN,
  });

  @override
  List<Object> get props => [id, craft];
}
