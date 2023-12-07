import '../../../../core/use_case/base_use_case.dart';
import '../../../../core/utils/custom_types.dart';
import '../entities/category_entity.dart';
import '../repositories/home_repo.dart';

class GetCategoriesUseCase extends UseCase<List<CategoryEntity>, void> {
  final HomeRepo homeRepo;

  GetCategoriesUseCase(this.homeRepo);

  @override
  Future<ResultOrFailure<List<CategoryEntity>>> call(void params) {
    return homeRepo.getCategories();
  }
}
