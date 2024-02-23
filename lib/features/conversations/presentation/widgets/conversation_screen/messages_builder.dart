import 'package:bns360_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../bloc/conversations_bloc.dart';
import '../messages/chat_message_item.dart';

class MessagesBuilder extends StatelessWidget {
  const MessagesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ConversationsBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: BlocBuilder<ConversationsBloc, ConversationsState>(
        builder: (context, state) {
          return MainListViewBuilder(
            scrollController: bloc.scrollController,
            list: bloc.messages,
            itemWidget: (message, index) {
              return ChatMessageItem(
                message: message,
              );
            },
            scrollDirection: Axis.vertical,
          );
        },
      ),
    );
  }
}
