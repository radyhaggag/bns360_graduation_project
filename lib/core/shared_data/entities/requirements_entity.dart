import 'package:equatable/equatable.dart';

class RequirementsEntity extends Equatable {
  final List<String> requirements;

  const RequirementsEntity({required this.requirements});

  @override
  List<Object?> get props => [requirements];
}
