import 'package:bns360_graduation_project/core/shared_data/entities/publisher_details_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/requirements_entity.dart';
import 'package:equatable/equatable.dart';

import '../../utils/enums/job_type.dart';
import 'contact_entity.dart';

class JobEntity extends Equatable {
  final String? id;
  final String jobTitleArabic;
  final String jobTitleEnglish;
  final String jobDescriptionArabic;
  final String jobDescriptionEnglish;
  final RequirementsEntity requirementsArabic;
  final RequirementsEntity requirementEnglish;
  final JobType type;
  final int workHours;
  final num salary;
  final PublisherDetailsEntity publisherDetails;
  final String? whatsapp;
  final ContactEntity? contacts;
  final bool isBelongToMe;

  const JobEntity({
    this.id,
    required this.contacts,
    this.isBelongToMe = false,
    required this.jobDescriptionArabic,
    required this.jobDescriptionEnglish,
    required this.jobTitleArabic,
    required this.jobTitleEnglish,
    required this.publisherDetails,
    required this.requirementsArabic,
    required this.requirementEnglish,
    required this.salary,
    required this.type,
    required this.whatsapp,
    required this.workHours,
  });

  JobEntity copyWith({
    String? id,
    String? jobTitleArabic,
    String? jobTitleEnglish,
    String? jobDescriptionArabic,
    String? jobDescriptionEnglish,
    RequirementsEntity? requirementsArabic,
    RequirementsEntity? requirementEnglish,
    JobType? type,
    int? workHours,
    num? salary,
    PublisherDetailsEntity? publisherDetails,
    String? whatsapp,
    ContactEntity? contacts,
    bool? isBelongToMe,
  }) {
    return JobEntity(
      id: id ?? this.id,
      jobTitleArabic: jobTitleArabic ?? this.jobTitleArabic,
      jobTitleEnglish: jobTitleEnglish ?? this.jobTitleEnglish,
      jobDescriptionArabic: jobDescriptionArabic ?? this.jobDescriptionArabic,
      jobDescriptionEnglish:
          jobDescriptionEnglish ?? this.jobDescriptionEnglish,
      requirementsArabic: requirementsArabic ?? this.requirementsArabic,
      requirementEnglish: requirementEnglish ?? this.requirementEnglish,
      type: type ?? this.type,
      workHours: workHours ?? this.workHours,
      salary: salary ?? this.salary,
      publisherDetails: publisherDetails ?? this.publisherDetails,
      whatsapp: whatsapp ?? this.whatsapp,
      contacts: contacts ?? this.contacts,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
    );
  }

  @override
  List<Object?> get props => [id];
}
