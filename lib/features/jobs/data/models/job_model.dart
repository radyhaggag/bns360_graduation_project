import '../../../../core/shared_data/models/profile/user_model.dart';
import '../../domain/entities/job_entity.dart';

class JobModel extends JobEntity {
  const JobModel({
    required super.id,
    required super.jobTitle,
    required super.description,
    required super.salary,
    required super.requirements,
    required super.date,
    required super.publisher,
    required super.workHours,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      description: json['description'],
      jobTitle: json['jobTitle'],
      salary: json['salary'],
      requirements: json['requirements'],
      date: json['date'],
      workHours: json['workHours'],
      publisher: UserModel.fromJson(json['publisher']),
    );
  }
}
