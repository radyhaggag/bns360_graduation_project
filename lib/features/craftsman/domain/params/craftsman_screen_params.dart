import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/shared_data/entities/craftsman_info_entity.dart';

class CraftsmanScreenParams {
  final int itemId;
  final CraftsmanEntity? craftsmanEntity;
  final CraftsmanInfoEntity? craftsmanInfoEntity;
  final bool isBelongToMe;

  const CraftsmanScreenParams({
    required this.itemId,
    this.craftsmanEntity,
    this.craftsmanInfoEntity,
    this.isBelongToMe = false,
  });
}
