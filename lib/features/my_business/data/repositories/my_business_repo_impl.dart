import 'package:bns360_graduation_project/core/helpers/execute_and_handle_error.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/category_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/category_item_entity.dart';
import 'package:bns360_graduation_project/core/utils/custom_types.dart';
import 'package:bns360_graduation_project/features/my_business/domain/params/add_business_params.dart';

import '../../domain/repositories/my_business_repo.dart';
import '../datasources/my_business_remote_data_source.dart';

class MyBusinessRepoImpl implements MyBusinessRepo {
  final MyBusinessRemoteDataSource myBusinessRemoteDataSource;

  MyBusinessRepoImpl({
    required this.myBusinessRemoteDataSource,
  });

  @override
  FutureEither<void> addBusiness(AddBusinessParams params) async {
    // TODO: implement addBusiness
    throw UnimplementedError();
  }

  @override
  FutureEither<List<CategoryEntity>> getBusinessCategories() {
    return executeAndHandleErrorAsync(
      () => myBusinessRemoteDataSource.getBusinessCategories(),
    );
  }

  @override
  FutureEither<List<CategoryItemEntity>> getMyBusiness() {
    return executeAndHandleErrorAsync(
      () => myBusinessRemoteDataSource.getMyBusiness(),
    );
  }
}
