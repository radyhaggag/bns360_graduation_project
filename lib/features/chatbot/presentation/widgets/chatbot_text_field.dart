import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';

class ChatbotTextField extends StatelessWidget {
  const ChatbotTextField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.cardColor,
      child: BlocConsumer<ChatbotBloc, ChatbotState>(
        buildWhen: (previous, current) {
          final states = [
            SendChatbotMessageLoadingState,
            SendChatbotMessageErrorState,
            SendChatbotMessageSuccessState,
          ];
          return states.contains(current.runtimeType);
        },
        listener: (context, state) {
          if (state is SendChatbotMessageSuccessState) {
            textEditingController.clear();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        builder: (context, state) {
          if (state is SendChatbotMessageLoadingState) {
            return const CenterProgressIndicator();
          }
          return Row(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsetsDirectional.only(
                  top: 8.h,
                  bottom: 8.h,
                  start: 15.w,
                ),
                decoration: BoxDecoration(
                  color: context.theme.listTileTheme.tileColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 1.sw - 18.w - (44.r + 18.w + 8.w),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _BuildTextField(
                    textEditingController: textEditingController,
                  ),
                ),
              ),
              8.horizontalSpace,
              InkWell(
                onTap: () async {
                  _sendMessage(
                    context: context,
                    content: textEditingController.text,
                  );
                },
                child: Container(
                  height: 30.r,
                  width: 30.r,
                  alignment: Alignment.center,
                  child: Center(
                    child: SvgPicture.asset(
                      AppSvg.sendArrow,
                      color: AppColors.white,
                      width: 30.r,
                      height: 30.r,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _sendMessage({
    required BuildContext context,
    required String content,
  }) {
    final bloc = context.read<ChatbotBloc>();
    bloc.add(SendChatbotMessageEvent(content));
  }
}

class _BuildTextField extends StatelessWidget {
  const _BuildTextField({
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatbotBloc, ChatbotState>(
      buildWhen: (previous, current) {
        final states = [
          SendChatbotMessageLoadingState,
          SendChatbotMessageSuccessState,
          SendChatbotMessageErrorState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        return TextField(
          textAlignVertical: TextAlignVertical.center,
          maxLines: 5,
          minLines: 1,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: S.of(context).write_your_message,
            contentPadding: EdgeInsets.fromLTRB(12.r, 8.r, 12.r, 8.r),
            isCollapsed: false,
            isDense: false,
            fillColor: Colors.transparent,
            filled: true,
            border: withOutBorder,
            focusedBorder: withOutBorder,
            enabledBorder: withOutBorder,
            enabled: state is! SendChatbotMessageLoadingState,
          ),
        );
      },
    );
  }

  InputBorder get withOutBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      );
}
