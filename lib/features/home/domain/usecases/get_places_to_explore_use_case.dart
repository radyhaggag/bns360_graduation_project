import '../../../../core/shared_data/entities/category_details_entity.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../../../core/utils/custom_types.dart';
import '../repositories/home_repo.dart';

class GetPlacesToExploreUseCase
    extends UseCase<List<CategoryDetailsEntity>, void> {
  final HomeRepo homeRepo;

  GetPlacesToExploreUseCase(this.homeRepo);

  @override
  Future<ResultOrFailure<List<CategoryDetailsEntity>>> call(void params) {
    return homeRepo.getPlacesToExplore();
  }
}
