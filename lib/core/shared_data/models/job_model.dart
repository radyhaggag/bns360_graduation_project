import '../../utils/enums/job_type.dart';
import '../entities/job_entity.dart';
import 'contact_model.dart';
import 'publisher_details_model.dart';
import 'requirements_model.dart';

class JobModel extends JobEntity {
  const JobModel({
    required super.id,
    required super.contacts,
    required super.jobDescriptionArabic,
    required super.jobDescriptionEnglish,
    required super.jobTitleArabic,
    required super.jobTitleEnglish,
    required super.publisherDetails,
    required super.requirementsArabic,
    required super.requirementEnglish,
    required super.salary,
    required super.type,
    required super.workHours,
    required super.timeAddedjob,
    super.isBelongToMe,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {

    return JobModel(
      id: json['id'],
      jobDescriptionEnglish: json['jobDescriptionEnglish'],
      contacts: ContactModel.fromJson(json),
      jobTitleEnglish: json['jobTitleEnglish'],
      jobTitleArabic: json['jobTitleArabic'],
      salary: json['salary'],
      requirementEnglish: RequirementsModel.fromJson(
        json["requirementEnglish"],
      ),
      requirementsArabic: RequirementsModel.fromJson(
        json["requirementsArabic"],
      ),
      workHours: json['workHours'],
      publisherDetails: PublisherDetailsModel.fromJson(
        json['publisherDetails'],
      ),
      jobDescriptionArabic: json["jobDescriptionArabic"],
      type: JobType.fromString(json["type"]),
      timeAddedjob: DateTime.parse(json["timeAddedjob"]),
    );
  }

  factory JobModel.fromEntity(JobEntity entity) {
    return JobModel(
      id: entity.id,
      contacts: entity.contacts,
      jobDescriptionArabic: entity.jobDescriptionArabic,
      jobDescriptionEnglish: entity.jobDescriptionEnglish,
      jobTitleArabic: entity.jobTitleArabic,
      jobTitleEnglish: entity.jobTitleEnglish,
      publisherDetails: entity.publisherDetails,
      requirementsArabic: entity.requirementsArabic,
      requirementEnglish: entity.requirementEnglish,
      salary: entity.salary,
      type: entity.type,
      workHours: entity.workHours,
      isBelongToMe: entity.isBelongToMe,
      timeAddedjob: entity.timeAddedjob,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobTitleArabic': jobTitleArabic,
      'jobTitleEnglish': jobTitleEnglish,
      'jobDescriptionArabic': jobDescriptionArabic,
      'jobDescriptionEnglish': jobDescriptionEnglish,
      'requirementsArabic':
          RequirementsModel.fromEntity(requirementsArabic).toJson(),
      'requirementEnglish':
          RequirementsModel.fromEntity(requirementEnglish).toJson(),
      'publisherDetails':
          PublisherDetailsModel.fromEntity(publisherDetails).toJson(),
      'salary': salary,
      'workHours': workHours,
      'whatsapp': contacts?.whatsapp,
      'phonenumbers': contacts?.phoneNumber,
      'emails': contacts?.email,
      'uRls': contacts?.urlSite,
      'type': type.id.toString(),
    };
  }
}
