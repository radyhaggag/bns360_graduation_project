import 'package:equatable/equatable.dart';

import '../../utils/enums/job_type.dart';
import 'contact_entity.dart';
import 'publisher_details_entity.dart';
import 'requirements_entity.dart';

class JobEntity extends Equatable {
  final int id;
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
  final ContactEntity? contacts;
  final bool isBelongToMe;
  final DateTime timeAddedjob;
  final String userId;

  const JobEntity({
    required this.id,
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
    required this.workHours,
    required this.timeAddedjob,
    required this.userId,
  });

  JobEntity copyWith({
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
      id: id,
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
      contacts: contacts ?? this.contacts,
      isBelongToMe: isBelongToMe ?? this.isBelongToMe,
      timeAddedjob: timeAddedjob,
      userId: userId,
    );
  }

  @override
  List<Object?> get props => [id];
}
