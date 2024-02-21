import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets/app_svg.dart';
import '../../../../generated/l10n.dart';

class SendMessageDefaultField extends StatelessWidget {
  const SendMessageDefaultField({
    super.key,
    this.onPressPrefixIcon,
    required this.textEditingController,
  });

  final void Function()? onPressPrefixIcon;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (onPressPrefixIcon != null)
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 13.w,
            ),
            child: InkWell(
              onTap: onPressPrefixIcon ?? () {},
              child: SvgPicture.asset(
                AppSvg.attachment,
                width: 24.r,
                height: 24.r,
              ),
            ),
          ),
        Expanded(
          child: TextField(
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
            ),
          ),
        ),
      ],
    );
  }

  InputBorder get withOutBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      );
}
