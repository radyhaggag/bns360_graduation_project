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
    return executeAndHandleErrorAsync(
      () => craftsRemoteDataSource.getCrafts(),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> getCraftsmen() async {
    return executeAndHandleErrorAsync(
      () => craftsRemoteDataSource.getCraftsmen(),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> getCraftItemsById(String id) async {
    return executeAndHandleErrorAsync(
      () => craftsRemoteDataSource.getCraftItemsById(id),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> searchOnAllCrafts(
    String text,
  ) async {
    return executeAndHandleErrorAsync(
      () => craftsRemoteDataSource.searchOnAllCrafts(text),
    );
  }

  @override
  FutureEither<List<CraftsmanEntity>> searchOnCraftsById(
    String id,
    String text,
  ) async {
    return executeAndHandleErrorAsync(
      () => craftsRemoteDataSource.searchOnCraftsById(id, text),
    );
  }
}
