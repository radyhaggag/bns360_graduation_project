import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'send_message_default_field.dart';
import 'send_message_icon_btn.dart';

class ChatMessageTextField extends StatefulWidget {
  const ChatMessageTextField({
    super.key,
    this.onPressSendIcon,
    this.onPressPrefixIcon,
    this.onChange,
  });

  final Function(String message)? onPressSendIcon;
  final VoidCallback? onPressPrefixIcon;
  final Function(String text)? onChange;

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
      color: Theme.of(context).cardColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  color: Theme.of(context).listTileTheme.tileColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                width: 1.sw - 18.w - (44.r + 18.w + 8.w),
                child: Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: SendMessageDefaultField(
                        textEditingController: textEditingController,
                        onPressPrefixIcon: widget.onPressPrefixIcon,
                      ),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              SendMessageIconBtn(
                textEditingController: textEditingController,
                onPressSendIcon: widget.onPressSendIcon,
              ),
              18.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
