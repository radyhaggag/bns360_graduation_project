import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/category_item_info_entity.dart';

class CategoryItemScreenParams {
  final int itemId;
  final CategoryItemEntity? categoryItemEntity;
  final CategoryItemInfoEntity? categoryItemInfoEntity;
  final bool isBelongToMe;

  const CategoryItemScreenParams({
    required this.itemId,
    this.categoryItemEntity,
    this.categoryItemInfoEntity,
    this.isBelongToMe = false,
  });
}
