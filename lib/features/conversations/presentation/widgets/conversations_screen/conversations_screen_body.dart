import 'package:bns360_graduation_project/core/widgets/data_state_widget.dart';
import 'package:bns360_graduation_project/features/conversations/presentation/bloc/conversations_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/empty_card.dart';
import 'conversations_builder.dart';
import 'conversations_search_section.dart';
import 'lazy_loading_card.dart';

class ConversationsScreenBody extends StatelessWidget {
  const ConversationsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Container(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          bottom: 10.h,
        ),
        alignment: Alignment.center,
        child: BlocBuilder<ConversationsBloc, ConversationsState>(
          builder: (context, state) {
            final bloc = context.read<ConversationsBloc>();
            final errorMessage =
                state is GetConversationsErrorState ? state.message : "";
            return DataStateWidget(
              isLoading: !bloc.isInitialized,
              isError: state is GetConversationsErrorState,
              isLoaded: bloc.isInitialized,
              errorMessage: errorMessage,
              loadingWidget: const LazyLoadingCard(count: 8),
              loadedWidget: _LoadedWidget(conversationsBloc: bloc),
            );
          },
        ),
      ),
    );
  }
}

class _LoadedWidget extends StatelessWidget {
  const _LoadedWidget({required this.conversationsBloc});

  final ConversationsBloc conversationsBloc;

  @override
  Widget build(BuildContext context) {
    if (conversationsBloc.conversations.isEmpty &&
        !conversationsBloc.isSearchActive) {
      return Center(
        child: EmptyCard(
          title: S.of(context).there_are_no_messages_yet,
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 15.h),
          ConversationsSearchSection(
            conversationsBloc: conversationsBloc,
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: ConversationsListBuilder(
              conversations: conversationsBloc.conversations,
            ),
          ),
          if (conversationsBloc.conversations.isEmpty &&
              conversationsBloc.isSearchActive)
            EmptyCard(
              title: S.of(context).no_results,
            ),
        ],
      );
    }
  }
}
