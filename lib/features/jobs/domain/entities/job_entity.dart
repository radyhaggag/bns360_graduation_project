import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/profile/user_entity.dart';

class JobEntity extends Equatable {
  final String id;
  final String jobTitle;
  final String description;
  final String requirements;
  final String date;
  final num salary;
  final int workHours;
  final UserEntity publisher;

  const JobEntity({
    required this.id,
    required this.jobTitle,
    required this.description,
    required this.salary,
    required this.publisher,
    required this.requirements,
    required this.date,
    required this.workHours,
  });

  @override
  List<Object> get props => [id, jobTitle, description, salary];
}
