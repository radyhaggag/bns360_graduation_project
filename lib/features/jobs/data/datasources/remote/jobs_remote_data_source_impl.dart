import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/contact_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/requirements_entity.dart';
import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';
import 'package:bns360_graduation_project/core/utils/extensions/language.dart';
import 'package:bns360_graduation_project/features/jobs/domain/params/add_job_params.dart';
import 'package:translator/translator.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/shared_data/models/job_model.dart';
import '../../../../../core/utils/enums.dart';
import 'jobs_remote_data_source.dart';

class JobsRemoteDataSourceImpl implements JobsRemoteDataSource {
  final APIConsumer apiConsumer;

  JobsRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<JobModel>> getJobs() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllJobs,
    );
    final data = res.data;
    final jobs = List<JobModel>.from(data.map(
      (job) => JobModel.fromJson(job),
    ));
    return jobs;
  }

  @override
  Future<JobModel> getJobById(String id) async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.jobById(id),
    );
    final data = res.data;
    final job = JobModel.fromJson(data);
    return job;
  }

  @override
  Future<void> addJob(AddJobParams addJobParams) async {
    final translator = GoogleTranslator();

    late String titleAR;
    late String titleENG;
    late String aboutAR;
    late String aboutENG;
    late List<String> requirementsAR;
    late List<String> requirementsENG;

    if (addJobParams.description.detectLanguage == Language.arabic) {
      titleAR = addJobParams.title;
      final titleTranslation = await translator.translate(
        addJobParams.title,
        from: "ar",
        to: "en",
      );
      titleENG = titleTranslation.text;
      aboutAR = addJobParams.description;
      final translation = await translator.translate(
        addJobParams.description,
        from: "ar",
        to: "en",
      );
      aboutENG = translation.text;
      requirementsAR = addJobParams.requirements;
      final textToTranslated = requirementsAR.join("|");
      final requirementsTranslation = await translator.translate(
        textToTranslated,
        from: "ar",
        to: "en",
      );
      requirementsENG = requirementsTranslation.text.split("|");
    } else {
      titleENG = addJobParams.title;
      final titleTranslation = await translator.translate(
        addJobParams.title,
        from: "en",
        to: "ar",
      );
      titleAR = titleTranslation.text;
      aboutENG = addJobParams.description;
      final translation = await translator.translate(
        addJobParams.description,
        from: "en",
        to: "ar",
      );
      aboutAR = translation.text;
      requirementsENG = addJobParams.requirements;
      final textToTranslated = requirementsENG.join("|");
      final requirementsTranslation = await translator.translate(
        textToTranslated,
        from: "en",
        to: "ar",
      );
      requirementsAR = requirementsTranslation.text.split("|");
    }

    final contacts = ContactEntity(
      phoneNumber: addJobParams.phoneNumber,
    );

    final jobModel = JobModel(
      id: -1,
      contacts: contacts.copyWith(
        whatsapp: addJobParams.whatsapp,
      ),
      jobDescriptionArabic: aboutAR,
      jobDescriptionEnglish: aboutENG,
      jobTitleArabic: titleAR,
      jobTitleEnglish: titleENG,
      requirementsArabic: RequirementsEntity(requirements: requirementsAR),
      requirementEnglish: RequirementsEntity(requirements: requirementsENG),
      salary: addJobParams.salary.toInt(),
      workHours: addJobParams.workHours,
      type: addJobParams.jobType,
      publisherDetails: AppProvider().getPublisherDetails()!,
      timeAddedjob: DateTime.now(),
    );
    final data = jobModel.toJson();
    await apiConsumer.post(
      endpoint: AppEndpoints.addJob,
      data: data,
    );
  }

  @override
  Future<void> editJob(JobEntity job) async {
    final model = JobModel.fromEntity(job);
    final path = AppEndpoints.jobById(job.id.toString());
    final data = model.toJson()..addAll({"id": model.id});
    await apiConsumer.put(
      endpoint: path,
      data: data,
    );
  }
}
