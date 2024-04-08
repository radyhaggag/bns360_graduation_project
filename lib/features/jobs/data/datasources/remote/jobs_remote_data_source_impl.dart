import 'package:bns360_graduation_project/features/jobs/domain/params/add_job_params.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../models/job_model.dart';
import 'jobs_remote_data_source.dart';

class JobsRemoteDataSourceImpl implements JobsRemoteDataSource {
  final APIConsumer apiConsumer;

  JobsRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<JobModel>> getJobs() async {
    final res = await loadJsonFromAsset('jobs.json');
    final crafts = List<JobModel>.from(res['data'].map(
      (craft) => JobModel.fromJson(craft),
    ));
    return crafts;
  }

  @override
  Future<JobModel> getJobById(String id) async {
    final res = await loadJsonFromAsset('jobs.json');
    final jobs = List<JobModel>.from(res['data'].map(
      (craftsman) => JobModel.fromJson(craftsman),
    ));
    final item = jobs.firstWhere((item) => item.id == id);
    return item;
  }

  @override
  Future<List<JobModel>> searchOnJobs(String text) async {
    final res = await loadJsonFromAsset('jobs.json');
    final craftsmen = List<JobModel>.from(res['data'].map(
      (craftsman) => JobModel.fromJson(craftsman),
    ));
    final searchLowercase = text.toLowerCase();
    bool isTrue(String itemName) {
      final itemNameLowercase = itemName.toLowerCase();
      return searchLowercase.contains(itemNameLowercase) ||
          itemNameLowercase.contains(searchLowercase);
    }

    final filteredItems =
        craftsmen.where((item) => isTrue(item.jobTitle)).toList();
    return filteredItems;
  }

  @override
  Future<void> addJob(AddJobParams addJobParams) {
    // TODO: implement addJob
    throw UnimplementedError();
  }
}
