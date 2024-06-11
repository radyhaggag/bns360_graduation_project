import 'package:bns360_graduation_project/core/shared_data/entities/category_item_info_entity.dart';

import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/categories_repo.dart';
import '../datasources/remote/categories_remote_data_source.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepoImpl(this.categoriesRemoteDataSource);

  @override
  FutureEither<List<CategoryEntity>> getCategories() async {
    return executeAndHandleErrorAsync<List<CategoryEntity>>(
      () => categoriesRemoteDataSource.getCategories(),
    );
  }

  @override
  FutureEither<List<CategoryItemInfoEntity>> getCategoryItemsById(
    int id,
  ) async {
    return executeAndHandleErrorAsync<List<CategoryItemInfoEntity>>(
      () => categoriesRemoteDataSource.getCategoryItemsById(id),
      onFailure: (error) async => <CategoryItemInfoEntity>[],
    );
  }
}
