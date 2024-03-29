import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/participant_entity.dart';
import 'picked_image_section.dart';
import 'send_message_default_field.dart';
import 'send_message_icon_btn.dart';

class ChatMessageTextField extends StatefulWidget {
  const ChatMessageTextField({
    super.key,
    this.onChange,
    required this.otherParticipant,
  });

  final Function(String text)? onChange;
  final ParticipantEntity otherParticipant;

  @override
  ChatMessageTextFieldState createState() => ChatMessageTextFieldState();
}

class ChatMessageTextFieldState extends State<ChatMessageTextField> {
  late final TextEditingController textEditingController;
  late final GlobalKey overlayAnchorKey;

  @override
  initState() {
    textEditingController = TextEditingController();
    overlayAnchorKey = GlobalKey();

    textEditingController.addListener(() {
      setState(() {});

      widget.onChange?.call(textEditingController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.bottomNavigationBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PickedImageSection(textEditingController: textEditingController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                key: overlayAnchorKey,
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
                  child: SendMessageDefaultField(
                    textEditingController: textEditingController,
                  ),
                ),
              ),
              8.horizontalSpace,
              SendMessageIconBtn(
                textEditingController: textEditingController,
                otherParticipant: widget.otherParticipant,
              ),
              15.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
