import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String nameAR;
  final String nameEN;
  final String imageUrl;

  const CategoryEntity({
    required this.id,
    required this.nameAR,
    required this.nameEN,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id, nameAR, nameEN, imageUrl];
}
