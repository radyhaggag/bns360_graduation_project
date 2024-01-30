import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/crafts_repo.dart';
import '../datasources/remote/crafts_remote_data_source.dart';

class CraftsRepoImpl implements CraftsRepo {
  final CraftsRemoteDataSource craftsRemoteDataSource;

  CraftsRepoImpl(this.craftsRemoteDataSource);

  @override
  FutureEither<List<CraftEntity>> getCrafts() async {
    return executeAndHandleError(
      () => craftsRemoteDataSource.getCrafts(),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> getCraftsmen() async {
    return executeAndHandleError(
      () => craftsRemoteDataSource.getCraftsmen(),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> getCraftItemsById(int id) async {
    return executeAndHandleError(
      () => craftsRemoteDataSource.getCraftItemsById(id),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> searchOnAllCrafts(
    String text,
  ) async {
    return executeAndHandleError(
      () => craftsRemoteDataSource.searchOnAllCrafts(text),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> searchOnCraftsById(
    int id,
    String text,
  ) async {
    return executeAndHandleError(
      () => craftsRemoteDataSource.searchOnCraftsById(id, text),
    );
  }
}
