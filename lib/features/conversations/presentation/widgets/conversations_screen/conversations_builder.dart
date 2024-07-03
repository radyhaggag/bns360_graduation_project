import 'package:bns360_graduation_project/features/conversations/presentation/bloc/conversations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../domain/entities/conversation_entity.dart';
import '../../../domain/params/conversation_screen_params.dart';
import 'conversations_card/conversations_card.dart';

class ConversationsListBuilder extends StatelessWidget {
  const ConversationsListBuilder({
    super.key,
    required this.conversations,
  });

  final List<ConversationEntity> conversations;

  @override
  Widget build(BuildContext context) {
    return MainListViewBuilder<ConversationEntity>(
      list: conversations,
      itemWidget: (conversation, index) {
        return Column(
          children: [
            ConversationCard(
              conversationEntity: conversation,
              onPressed: () {
                final currentParticipant =
                    context.read<ConversationsBloc>().currentParticipant;
                final otherParticipant =
                    conversation.otherParticipant(currentParticipant);
                if (otherParticipant == null) {
                  return;
                }
                final params = ConversationScreenParams(
                  participantEntity: otherParticipant,
                  conversationId: conversation.id,
                );
                Navigator.of(context).pushNamed(
                  Routes.conversation,
                  arguments: params,
                );
              },
            ),
            if (index != conversations.length - 1)
              Divider(
                color: context.theme.primaryColor.withAlpha(20),
                height: 15.h,
              ),
            if (index == conversations.length - 1)
              (MediaQuery.of(context).padding.bottom).verticalSpace,
          ],
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}
