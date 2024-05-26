import 'package:bns360_graduation_project/core/databases/local_storage/hive_manager.dart';
import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/models/job_model.dart';
import '../../../../../core/shared_data/models/property_model.dart';
import 'saved_remote_data_source.dart';

class SavedRemoteDataSourceImpl implements SavedRemoteDataSource {
  final APIConsumer apiConsumer;

  SavedRemoteDataSourceImpl(this.apiConsumer);

  String get userId => AppProvider().getProfile()!.id;

  @override
  Future<List<JobModel>> getSavedJobs() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.savedJobs,
      queryParams: {
        "UserId": userId,
      },
    );
    final jobs = List<JobModel>.from(res.data.map(
      (item) => JobModel.fromJson(item),
    ));

    await HiveBoxes.savedJobs.clear();

    HiveBoxes.savedJobs.addAll(jobs.map((e) => e.id));

    return jobs;
  }

  @override
  Future<List<PropertyModel>> getSavedProperties() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.savedProperties,
      queryParams: {
        "UserId": userId,
      },
    );
    final properties = List<PropertyModel>.from(res.data.map(
      (property) => PropertyModel.fromJson(property),
    ));

    await HiveBoxes.savedProperties.clear();

    HiveBoxes.savedProperties.addAll(properties.map((e) => e.id));

    return properties;
  }

  @override
  Future<void> saveJob(int jobId) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.savedJobs,
      data: {
        "UserId": userId,
        "JobId": jobId,
      },
    );

    await HiveBoxes.savedJobs.put(jobId, jobId);
  }

  @override
  Future<void> saveProperty(int propertyId) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.savedProperties,
      data: {
        "UserId": userId,
        "PropertyId": propertyId,
      },
    );

    await HiveBoxes.savedProperties.put(propertyId, propertyId);
  }

  @override
  Future<void> unSaveJob(int jobId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.savedJobs,
      queries: {
        "UserId": userId,
        "JobId": jobId,
      },
    );

    await HiveBoxes.savedJobs.delete(jobId);
  }

  @override
  Future<void> unSaveProperty(int propertyId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.savedProperties,
      queries: {
        "UserId": userId,
        "PropertyId": propertyId,
      },
    );

    await HiveBoxes.savedProperties.delete(propertyId);
  }
}
