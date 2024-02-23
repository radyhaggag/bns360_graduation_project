import 'package:bns360_graduation_project/features/conversations/presentation/bloc/conversations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'send_message_default_field.dart';
import 'send_message_icon_btn.dart';

class ChatMessageTextField extends StatefulWidget {
  const ChatMessageTextField({
    super.key,
    this.onPressSendIcon,
    this.onSuffixIconPressed,
    this.onChange,
  });

  final Function(String message)? onPressSendIcon;
  final VoidCallback? onSuffixIconPressed;
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
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PickedImageSection(textEditingController: textEditingController),
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
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 1.sw - 18.w - (44.r + 18.w + 8.w),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: SendMessageDefaultField(
                    textEditingController: textEditingController,
                    onSuffixIconPressed: widget.onSuffixIconPressed,
                  ),
                ),
              ),
              8.horizontalSpace,
              SendMessageIconBtn(
                textEditingController: textEditingController,
                onPressSendIcon: widget.onPressSendIcon,
              ),
              15.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}

class _PickedImageSection extends StatelessWidget {
  const _PickedImageSection({
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationsBloc, ConversationsState>(
      builder: (context, state) {
        final bloc = context.read<ConversationsBloc>();
        if (bloc.pickedFile == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: 15.w,
            top: 10.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.w,
                height: 100.r,
                child: Image(
                  image: FileImage(bloc.pickedFile!),
                  width: 150.w,
                ),
              ),
              Flexible(
                child: Text(
                  textEditingController.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).highlightColor,
                      ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
