import 'package:equatable/equatable.dart';

class PublisherDetailsEntity extends Equatable {
  final String? photoUrl;
  final String? name;
  final String? description;

  const PublisherDetailsEntity({
    this.photoUrl,
    this.name,
    this.description,
  });

  @override
  List<Object?> get props => [photoUrl, name, description];
}
