import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../config/route_config.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/shared_data/entities/participant_entity.dart';
import '../entities/conversation_entity.dart';

class ConversationScreenParams extends Equatable {
  final ParticipantEntity participantEntity;
  final ConversationEntity? conversationEntity;
  final CraftsmanEntity? craftsmanEntity;
  final CategoryItemEntity? categoryItemEntity;

  const ConversationScreenParams({
    required this.participantEntity,
    this.craftsmanEntity,
    this.categoryItemEntity,
    this.conversationEntity,
  });

  void navigationRoute(BuildContext context) {
    if (craftsmanEntity != null) {
      Navigator.of(context).pushNamed(
        Routes.craftsman,
        arguments: craftsmanEntity,
      );
    } else if (categoryItemEntity != null) {
      Navigator.of(context).pushNamed(
        Routes.categoryItem,
        arguments: categoryItemEntity,
      );
    }
  }

  @override
  List<Object?> get props => [participantEntity];
}
