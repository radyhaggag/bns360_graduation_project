import 'package:bns360_graduation_project/core/shared_data/models/contact_model.dart';
import 'package:bns360_graduation_project/core/shared_data/models/publisher_details_model.dart';
import 'package:bns360_graduation_project/core/shared_data/models/requirements_model.dart';
import 'package:bns360_graduation_project/core/utils/enums/job_type.dart';

import '../entities/job_entity.dart';

class JobModel extends JobEntity {
  const JobModel({
    super.id,
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
    required super.whatsapp,
    required super.workHours,
    super.isBelongToMe,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    final isContactsList = json["contacts"] != null && json["contacts"] is List;
    final contacts = isContactsList ? json["contacts"].first : json["contacts"];

    return JobModel(
      id: json['id'],
      jobDescriptionEnglish: json['jobDescriptionEnglish'],
      contacts: contacts != null
          ? ContactModel.fromJson(contacts)
          : const ContactModel(),
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
      whatsapp: json['whatsapp'],
      publisherDetails: PublisherDetailsModel.fromJson(
        json['publisherDetails'],
      ),
      jobDescriptionArabic: json["jobDescriptionArabic"],
      type: JobType.fromString(json["type"]),
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
      whatsapp: entity.whatsapp,
      workHours: entity.workHours,
      isBelongToMe: entity.isBelongToMe,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobDescriptionEnglish': jobDescriptionEnglish,
      'contacts': contacts != null
          ? [ContactModel.fromEntity(contacts!).toJson()]
          : null,
      'jobTitleEnglish': jobTitleEnglish,
      'jobTitleArabic': jobTitleArabic,
      'salary': salary,
      'requirementEnglish':
          RequirementsModel.fromEntity(requirementEnglish).toJson(),
      'requirementsArabic':
          RequirementsModel.fromEntity(requirementsArabic).toJson(),
      'workHours': workHours,
      'whatsapp': whatsapp,
      'publisherDetails':
          PublisherDetailsModel.fromEntity(publisherDetails).toJson(),
      'jobDescriptionArabic': jobDescriptionArabic,
      'type': type.id.toString(),
    };
  }
}
