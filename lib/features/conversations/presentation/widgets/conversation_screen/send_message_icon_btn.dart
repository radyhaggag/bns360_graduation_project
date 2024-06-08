import 'package:bns360_graduation_project/core/utils/enums.dart';
import 'package:bns360_graduation_project/core/utils/extensions/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../domain/params/send_message_params.dart';
import '../../bloc/conversations_bloc.dart';

class SendMessageIconBtn extends StatelessWidget {
  const SendMessageIconBtn({
    super.key,
    required this.textEditingController,
    required this.otherParticipant,
  });

  final TextEditingController textEditingController;
  final ParticipantEntity otherParticipant;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConversationsBloc, ConversationsState>(
      buildWhen: (previous, current) {
        final states = [
          SendMessageLoadingState,
          SendMessageSuccessState,
          SendMessageErrorState,
        ];
        return states.contains(current.runtimeType);
      },
      listener: (context, state) {
        if (state is SendMessageSuccessState) {
          textEditingController.clear();
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      builder: (context, state) {
        if (state is SendMessageLoadingState) {
          return const CenterProgressIndicator();
        }
        return InkWell(
          onTap: () async {
            _sendMessage(
              context: context,
              content: textEditingController.text,
              otherParticipant: otherParticipant,
            );
          },
          child: Container(
            height: 30.r,
            width: 30.r,
            alignment: Alignment.center,
            child: Center(
              child: RotatedBox(
                quarterTurns:
                    context.currentLanguage == Language.arabic ? 2 : 0,
                child: SvgPicture.asset(
                  AppSvg.sendArrow,
                  color: AppColors.white,
                  width: 30.r,
                  height: 30.r,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _sendMessage({
    required BuildContext context,
    required String content,
    required ParticipantEntity otherParticipant,
  }) {
    final bloc = context.read<ConversationsBloc>();
    bloc.add(SendMessageEvent(
      sendMessageParams: SendMessageParams(
        content: content,
        otherParticipant: otherParticipant,
        isFirstMsg: bloc.messages.isEmpty,
      ),
    ));
  }
}
