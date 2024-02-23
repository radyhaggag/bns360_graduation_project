import 'package:bns360_graduation_project/core/helpers/date_formatter.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/participant_entity.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../bloc/conversations_bloc.dart';
import '../messages/chat_message_item.dart';

class MessagesBuilder extends StatefulWidget {
  const MessagesBuilder({super.key, required this.otherParticipant});

  final ParticipantEntity otherParticipant;

  @override
  State<MessagesBuilder> createState() => _MessagesBuilderState();
}

class _MessagesBuilderState extends State<MessagesBuilder> {
  late final ConversationsBloc bloc;

  void _scrollToBottom() {
    bloc.scrollController.animateTo(
      bloc.scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    bloc = context.read<ConversationsBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              bool isFirstMessageOfDay = index == 0 ||
                  bloc.messages[index - 1].date.day != message.date.day;

              return Column(
                children: [
                  if (isFirstMessageOfDay)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        DateFormatter.dateFormatForDisplay(
                          context: context,
                          dateTime: message.date,
                        ),
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: AppFontSize.details,
                                ),
                      ),
                    ),
                  ChatMessageItem(
                    message: message,
                    otherParticipant: widget.otherParticipant,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
            scrollDirection: Axis.vertical,
          );
        },
      ),
    );
  }
}
