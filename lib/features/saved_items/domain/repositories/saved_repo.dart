import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/utils/custom_types.dart';

abstract class SavedRepo {
  FutureEither<List<JobEntity>> getSavedJobs();
  FutureEither<List<PropertyEntity>> getSavedProperties();
}
