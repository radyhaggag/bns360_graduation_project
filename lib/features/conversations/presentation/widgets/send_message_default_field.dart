import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class SendMessageDefaultField extends StatelessWidget {
  const SendMessageDefaultField({
    super.key,
    this.onSuffixIconPressed,
    required this.textEditingController,
  });

  final void Function()? onSuffixIconPressed;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
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
        prefixIconConstraints: BoxConstraints(
          maxHeight: 16.r,
          maxWidth: 11.r,
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 32.r,
          maxWidth: 32.r,
        ),
        suffixIcon: InkWell(
          onTap: onSuffixIconPressed,
          child: Container(
            margin: EdgeInsetsDirectional.only(
              end: 15.w,
            ),
            child: Icon(
              Icons.photo_camera_outlined,
              size: 22.r,
            ),
          ),
        ),
      ),
    );
  }

  InputBorder get withOutBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      );
}
