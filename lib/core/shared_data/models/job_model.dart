import 'package:bns360_graduation_project/core/providers/app_provider.dart';

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
    required super.userId,
    super.isBelongToMe,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {

    return JobModel(
      id: json['Id'],
      userId: json['UserId'],
      jobDescriptionEnglish: json['JobDescriptionEnglish'],
      contacts: ContactModel.fromJson(json),
      jobTitleEnglish: json['JobTitleEnglish'],
      jobTitleArabic: json['JobTitleArabic'],
      salary: json['Salary'],
      requirementEnglish: RequirementsModel.fromJson(
        json["RequirementEnglish"],
      ),
      requirementsArabic: RequirementsModel.fromJson(
        json["RequirementsArabic"],
      ),
      workHours: json['WorkHours'],
      publisherDetails: PublisherDetailsModel.fromJson(
        json['PublisherDetails'],
      ),
      jobDescriptionArabic: json["JobDescriptionArabic"],
      type: JobType.fromString(json["Type"]),
      timeAddedjob: DateTime.parse(json["TimeAddedjob"]),
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
      userId: entity.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'JobTitleArabic': jobTitleArabic,
      'JobTitleEnglish': jobTitleEnglish,
      'JobDescriptionArabic': jobDescriptionArabic,
      'JobDescriptionEnglish': jobDescriptionEnglish,
      'RequirementsArabic':
          RequirementsModel.fromEntity(requirementsArabic).toJson(),
      'RequirementEnglish':
          RequirementsModel.fromEntity(requirementEnglish).toJson(),
      'PublisherDetails':
          PublisherDetailsModel.fromEntity(publisherDetails).toJson(),
      'Salary': salary,
      'WorkHours': workHours,
      'Whatsapp': contacts?.whatsapp,
      'Phonenumbers': contacts?.phoneNumber,
      'Emails': contacts?.email,
      'URls': contacts?.urlSite,
      'Type': type.id.toString(),
      'UserId': AppProvider().getProfile()!.id,
    };
  }
}
