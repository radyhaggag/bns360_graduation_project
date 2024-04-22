import 'package:equatable/equatable.dart';

import 'profile/user_entity.dart';

class JobEntity extends Equatable {
  final String id;
  final String jobTitle;
  final String description;
  final List<String> requirements;
  final String date;
  final num salary;
  final int workHours;
  final UserEntity publisher;
  final String? phoneNumber;
  final String? whatsapp;

  const JobEntity({
    required this.id,
    required this.jobTitle,
    required this.description,
    required this.salary,
    required this.publisher,
    required this.requirements,
    required this.date,
    required this.workHours,
    this.phoneNumber,
    this.whatsapp,
  });

  @override
  List<Object> get props => [id, jobTitle, description, salary];
}
