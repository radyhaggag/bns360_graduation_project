import 'package:equatable/equatable.dart';

class CraftEntity extends Equatable {
  final int id;
  final String nameAR;
  final String nameEN;

  const CraftEntity({
    required this.id,
    required this.nameAR,
    required this.nameEN,
  });

  @override
  List<Object> get props => [id, nameAR, nameEN];
}
