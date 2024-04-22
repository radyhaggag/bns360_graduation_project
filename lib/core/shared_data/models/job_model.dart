import '../entities/job_entity.dart';
import 'profile/user_model.dart';

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
    super.phoneNumber,
    super.whatsapp,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      description: json['description'],
      jobTitle: json['jobTitle'],
      salary: json['salary'],
      requirements: List<String>.from(
        json['requirements'].map((e) => e.toString()),
      ),
      date: json['date'],
      workHours: json['workHours'],
      phoneNumber: json['phoneNumber'],
      whatsapp: json['whatsapp'],
      publisher: UserModel.fromJson(json['publisher']),
    );
  }
}
