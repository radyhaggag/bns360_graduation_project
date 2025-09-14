import '../../../../core/utils/enums/job_type.dart';

class AddJobParams {
  final String title;
  final String description;
  final List<String> requirements;
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
      'requirements': requirements.map((e) => e).toList(),
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
      requirements: List<String>.from(map['requirements'].map(
        (e) => e.toString(),
      )),
      jobType: JobType.fromId(map['jobType'] as int),
      workHours: map['workHours'] as int,
      salary: map['salary'] as double,
      phoneNumber: map['phoneNumber'] as String,
      whatsapp: map['whatsapp'] as String,
    );
  }

  AddJobParams copyWith({
    String? title,
    String? description,
    List<String>? requirements,
    JobType? jobType,
    int? workHours,
    double? salary,
    String? phoneNumber,
    String? whatsapp,
  }) {
    return AddJobParams(
      title: title ?? this.title,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      jobType: jobType ?? this.jobType,
      workHours: workHours ?? this.workHours,
      salary: salary ?? this.salary,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsapp: whatsapp ?? this.whatsapp,
    );
  }
}
