import 'package:bns360_graduation_project/core/providers/app_provider.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/databases/local_storage/hive_manager.dart';
import '../../../../../core/shared_data/models/category_item_model.dart';
import '../../../../../core/shared_data/models/craftsman_model.dart';
import '../../../../../core/shared_data/models/review_summary_model.dart';
import '../../../../../core/utils/app_endpoints.dart';
import 'favorites_remote_data_source.dart';

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final APIConsumer apiConsumer;

  FavoritesRemoteDataSourceImpl(this.apiConsumer);

  String get userId => AppProvider().getProfile()!.id;

  @override
  Future<List<CategoryItemModel>> getFavoriteCategories() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getBusinessFavorites(userId),
    );
    final categoriesFuture = List<Future<CategoryItemModel>>.from(res.data.map(
      (item) => _mapAndGetCategoryItemModel(item),
    ));

    final categories = await Future.wait(categoriesFuture);

    await HiveBoxes.favoriteBusiness.clear();

    HiveBoxes.favoriteBusiness.addAll(categories.map((e) => e.id));

    return categories;
  }

  Future<CategoryItemModel> _mapAndGetCategoryItemModel(
      Map<String, dynamic> json) async {
    CategoryItemModel model = CategoryItemModel.fromJson(json);

    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getBusinessReviewSummary(model.id),
    );
    final reviewSummary = ReviewSummaryModel.fromJson(res.data);
    model = CategoryItemModel.fromEntity(
      model.copyWith(reviewSummary: reviewSummary),
    );

    return model;
  }

  @override
  Future<List<CraftsmanModel>> getFavoriteCraftsmen() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getCraftsmenFavorites(userId),
    );
    final categoriesFuture = List<Future<CraftsmanModel>>.from(res.data.map(
      (item) => _mapAndGetCraftsmanModel(item),
    ));

    final craftsmen = await Future.wait(categoriesFuture);

    await HiveBoxes.favoriteCrafts.clear();

    HiveBoxes.favoriteCrafts.addAll(craftsmen.map((e) => e.id));

    return craftsmen;
  }

  Future<CraftsmanModel> _mapAndGetCraftsmanModel(
    Map<String, dynamic> json,
  ) async {
    CraftsmanModel model = CraftsmanModel.fromJson(json);

    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getCraftsmanReviewSummary(model.id),
    );
    final reviewSummary = ReviewSummaryModel.fromJson(res.data);
    model = CraftsmanModel.fromEntity(
      model.copyWith(reviewSummary: reviewSummary),
    );

    return model;
  }

  @override
  Future<void> addCategoryItemToFavorite(int itemId) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.businessFavorite,
      data: {
        "UserId": userId,
        "BusinessId": itemId,
      },
    );
    await HiveBoxes.favoriteBusiness.put(itemId, itemId);
  }

  @override
  Future<void> removeCategoryItemFromFavorite(int itemId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.businessFavorite,
      queries: {
        "BusinessId": itemId,
        "userId": userId,
      },
    );
    await HiveBoxes.favoriteBusiness.delete(itemId);
  }

  @override
  Future<void> addCraftsmanToFavorite(int itemId) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.craftsmenFavorite,
      data: {
        "UserId": userId,
        "BusinessId": itemId,
      },
    );
    await HiveBoxes.favoriteCrafts.put(itemId, itemId);
  }

  @override
  Future<void> removeCraftsmanFromFavorite(int itemId) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.craftsmenFavorite,
      data: {
        "UserId": userId,
        "BusinessId": itemId,
      },
    );
    await HiveBoxes.favoriteCrafts.delete(itemId);
  }
}
