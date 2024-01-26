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
    return executeAndHandleError<List<CategoryEntity>>(
      () => categoriesRemoteDataSource.getCategories(),
    );
  }
}
