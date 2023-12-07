import '../../../../core/use_case/base_use_case.dart';
import '../../../../core/utils/custom_types.dart';
import '../entities/banner_entity.dart';
import '../repositories/home_repo.dart';

class GetBannersUseCase extends UseCase<List<BannerEntity>, void> {
  final HomeRepo homeRepo;

  GetBannersUseCase(this.homeRepo);

  @override
  Future<ResultOrFailure<List<BannerEntity>>> call(void params) {
    return homeRepo.getBanners();
  }
}
