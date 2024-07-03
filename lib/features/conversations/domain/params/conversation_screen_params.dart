// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../config/route_config.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/shared_data/entities/participant_entity.dart';
import '../../../category_item/domain/params/category_item_screen_params.dart';
import '../../../craftsman/domain/params/craftsman_screen_params.dart';
import '../entities/conversation_entity.dart';

class ConversationScreenParams extends Equatable {
  final ParticipantEntity participantEntity;
  final ConversationEntity? conversationEntity;
  final CraftsmanEntity? craftsmanEntity;
  final CategoryItemEntity? categoryItemEntity;
  final String? conversationId;

  const ConversationScreenParams({
    required this.participantEntity,
    this.craftsmanEntity,
    this.categoryItemEntity,
    this.conversationEntity,
    this.conversationId,
  });

  void navigationRoute(BuildContext context) {
    if (craftsmanEntity != null) {
      Navigator.of(context).pushNamed(
        Routes.craftsman,
        arguments: CraftsmanScreenParams(
          itemId: craftsmanEntity!.id,
          craftsmanEntity: craftsmanEntity,
        ),
      );
    } else if (categoryItemEntity != null) {
      Navigator.of(context).pushNamed(
        Routes.categoryItem,
        arguments: CategoryItemScreenParams(
          itemId: categoryItemEntity!.id,
          categoryItemEntity: categoryItemEntity,
          isBelongToMe: categoryItemEntity!.isBelongToMe,
        ),
      );
    }
  }

  @override
  List<Object?> get props => [participantEntity];

  ConversationScreenParams copyWith({
    ParticipantEntity? participantEntity,
    ConversationEntity? conversationEntity,
    CraftsmanEntity? craftsmanEntity,
    CategoryItemEntity? categoryItemEntity,
    String? conversationId,
  }) {
    return ConversationScreenParams(
      participantEntity: participantEntity ?? this.participantEntity,
      conversationEntity: conversationEntity ?? this.conversationEntity,
      craftsmanEntity: craftsmanEntity ?? this.craftsmanEntity,
      categoryItemEntity: categoryItemEntity ?? this.categoryItemEntity,
      conversationId: conversationId ?? this.conversationId,
    );
  }
}
