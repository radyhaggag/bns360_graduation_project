import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/shared_data/models/job_model.dart';
import '../../../../../core/shared_data/models/property_model.dart';
import 'saved_remote_data_source.dart';

class SavedRemoteDataSourceImpl implements SavedRemoteDataSource {
  final APIConsumer apiConsumer;

  SavedRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<JobModel>> getSavedJobs() async {
    final res = await loadJsonFromAsset('jobs.json');
    final jobs = List<JobModel>.from(res['data'].map(
      (item) => JobModel.fromJson(item),
    ));
    return jobs;
  }

  @override
  Future<List<PropertyModel>> getSavedProperties() async {
    final res = await loadJsonFromAsset('properties.json');
    final properties = List<PropertyModel>.from(res['data'].map(
      (property) => PropertyModel.fromJson(property),
    ));
    return properties;
  }
}
