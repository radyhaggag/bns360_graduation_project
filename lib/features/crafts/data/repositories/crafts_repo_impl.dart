import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_info_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/crafts_repo.dart';
import '../datasources/remote/crafts_remote_data_source.dart';

class CraftsRepoImpl implements CraftsRepo {
  final CraftsRemoteDataSource craftsRemoteDataSource;

  CraftsRepoImpl(this.craftsRemoteDataSource);

  @override
  FutureEither<List<CraftEntity>> getCrafts() async {
    return executeAndHandleErrorAsync(
      () => craftsRemoteDataSource.getCrafts(),
    );
  }

  @override
  FutureEither<List<CraftsmanInfoEntity>> getCraftItemsById(int id) async {
    return executeAndHandleErrorAsync(
      () => craftsRemoteDataSource.getCraftItemsById(id),
    );
  }
}
