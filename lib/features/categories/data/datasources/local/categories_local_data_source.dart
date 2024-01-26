import '../../../../../core/shared_data/models/category_model.dart';

abstract class CategoriesLocalDataSource {
  List<CategoryModel> getCategories();
}
