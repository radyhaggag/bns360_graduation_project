import 'package:bns360_graduation_project/features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/date_formatter.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import 'chatbot_message_item.dart';

class ChatbotMessagesBuilder extends StatefulWidget {
  const ChatbotMessagesBuilder({super.key});

  @override
  State<ChatbotMessagesBuilder> createState() => _ChatbotMessagesBuilderState();
}

class _ChatbotMessagesBuilderState extends State<ChatbotMessagesBuilder> {
  late final ChatbotBloc bloc;

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
    bloc = context.read<ChatbotBloc>();
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
      child: BlocBuilder<ChatbotBloc, ChatbotState>(
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
                        style: context.textTheme.titleMedium?.copyWith(
                          fontSize: AppFontSize.details,
                        ),
                      ),
                    ),
                  ChatbotMessageItem(
                    message: message,
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
