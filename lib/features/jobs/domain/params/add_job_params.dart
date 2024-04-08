import 'dart:convert';

import 'package:bns360_graduation_project/core/utils/enums/job_type.dart';

class AddJobParams {
  final String title;
  final String description;
  final String requirements;
  final JobType jobType;
  final int workHours;
  final double salary;
  final String phoneNumber;
  final String whatsapp;

  AddJobParams({
    required this.title,
    required this.description,
    required this.requirements,
    required this.jobType,
    required this.workHours,
    required this.salary,
    required this.phoneNumber,
    required this.whatsapp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'requirements': requirements,
      'jobType': jobType.id,
      'workHours': workHours,
      'salary': salary,
      'phoneNumber': phoneNumber,
      'whatsapp': whatsapp,
    };
  }

  factory AddJobParams.fromMap(Map<String, dynamic> map) {
    return AddJobParams(
      title: map['title'] as String,
      description: map['description'] as String,
      requirements: map['requirements'] as String,
      jobType: JobType.fromId(map['jobType'] as int),
      workHours: map['workHours'] as int,
      salary: map['salary'] as double,
      phoneNumber: map['phoneNumber'] as String,
      whatsapp: map['whatsapp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddJobParams.fromJson(String source) =>
      AddJobParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
