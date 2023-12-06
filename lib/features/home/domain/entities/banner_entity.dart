import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String id;
  final String imageUrl;

  const BannerEntity({
    required this.id,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id, imageUrl];
}
