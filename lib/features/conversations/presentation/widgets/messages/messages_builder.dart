import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../bloc/conversations_bloc.dart';
import 'chat_message_item.dart';

class MessagesBuilder extends StatelessWidget {
  const MessagesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationsBloc, ConversationsState>(
      builder: (context, state) {
        final bloc = context.read<ConversationsBloc>();
        return MainListViewBuilder(
          list: bloc.messages,
          itemWidget: (message) {
            return ChatMessageItem(
              message: message,
            );
          },
          scrollDirection: Axis.vertical,
        );
      },
    );
  }
}
