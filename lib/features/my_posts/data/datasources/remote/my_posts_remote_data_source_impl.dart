import '../../../../../core/providers/app_provider.dart';
import '../../../../../core/utils/app_endpoints.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/shared_data/models/job_model.dart';
import '../../../../../core/shared_data/models/property_model.dart';
import 'my_posts_remote_data_source.dart';

class MyPostsRemoteDataSourceImpl implements MyPostsRemoteDataSource {
  final APIConsumer apiConsumer;

  MyPostsRemoteDataSourceImpl(this.apiConsumer);

  String get userId => AppProvider().getProfile()!.id;

  @override
  Future<List<JobModel>> getMyPostsJobs() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.myPostsJobs(userId),
    );

    if (res.data is! List) return [];

    final jobs = List<JobModel>.from(res.data.map(
      (item) {
        final job = JobModel.fromJson(item).copyWith(
          isBelongToMe: true,
        );
        return JobModel.fromEntity(job);
      },
    ));
    return jobs;
  }

  @override
  Future<List<PropertyModel>> getMyPostsProperties() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.myPostsProperties(userId),
    );

    if (res.data is! List) return [];

    final properties = List<PropertyModel>.from(res.data.map(
      (item) {
        final property = PropertyModel.fromJson(item).copyWith(
          isBelongToMe: true,
        );
        return PropertyModel.fromEntity(property);
      },
    ));
    return properties;
  }
}
