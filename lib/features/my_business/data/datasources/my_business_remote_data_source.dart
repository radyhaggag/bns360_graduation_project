import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/models/category_item_model.dart';
import '../../../../core/shared_data/models/category_model.dart';
import '../../domain/params/add_business_params.dart';

abstract class MyBusinessRemoteDataSource {
  Future<void> addBusiness(AddBusinessParams params);
  Future<void> updateBusiness(CategoryItemEntity params);
  Future<void> deleteBusiness(int businessId);
  Future<List<CategoryItemModel>> getMyBusiness();
  Future<List<CategoryModel>> getBusinessCategories();
}
