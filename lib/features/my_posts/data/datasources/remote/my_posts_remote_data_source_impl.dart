import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/shared_data/models/job_model.dart';
import '../../../../../core/shared_data/models/property_model.dart';
import 'my_posts_remote_data_source.dart';

class MyPostsRemoteDataSourceImpl implements MyPostsRemoteDataSource {
  final APIConsumer apiConsumer;

  MyPostsRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<JobModel>> getMyPostsJobs() async {
    final res = await loadJsonFromAsset('jobs.json');
    final jobs = List<JobModel>.from(res['data'].map(
      (item) => JobModel.fromJson(item),
    ));
    return jobs;
  }

  @override
  Future<List<PropertyModel>> getMyPostsProperties() async {
    final res = await loadJsonFromAsset('properties.json');
    final properties = List<PropertyModel>.from(res['data'].map(
      (property) => PropertyModel.fromJson(property),
    ));
    return properties;
  }
}
