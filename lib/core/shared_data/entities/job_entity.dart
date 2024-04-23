// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final bool isBelongToMe;

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
    this.isBelongToMe = false,
  });

  @override
  List<Object> get props => [id, jobTitle, description, salary];

  JobEntity copyWith({
    String? id,
    String? jobTitle,
    String? description,
    List<String>? requirements,
    String? date,
    num? salary,
    int? workHours,
    UserEntity? publisher,
    String? phoneNumber,
    String? whatsapp,
    bool? isBelongToMe,
  }) {
    return JobEntity(
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      date: date ?? this.date,
      salary: salary ?? this.salary,
      workHours: workHours ?? this.workHours,
      publisher: publisher ?? this.publisher,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsapp: whatsapp ?? this.whatsapp,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
    );
  }
}
