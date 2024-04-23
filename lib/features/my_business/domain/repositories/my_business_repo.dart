import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../params/add_business_params.dart';

abstract class MyBusinessRepo {
  FutureEither<void> addBusiness(AddBusinessParams params);
  FutureEither<List<CategoryItemEntity>> getMyBusiness();
  FutureEither<List<CategoryEntity>> getBusinessCategories();
}
