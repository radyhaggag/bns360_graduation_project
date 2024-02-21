import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendMessageIconBtn extends StatelessWidget {
  const SendMessageIconBtn({
    super.key,
    this.onPressSendIcon,
    required this.textEditingController,
  });

  final Function(String)? onPressSendIcon;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onPressSendIcon?.call(textEditingController.text);
        textEditingController.clear();
      },
      child: Container(
        height: 44.r,
        width: 44.r,
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   color: textEditingController.text.isEmpty
        //       ? AppColors.light
        //       : AppColors.lightBackground,
        //   borderRadius: BorderRadius.circular(8.r),
        // ),
        child: Center(
          child: SvgPicture.asset(
            AppSvg.sendArrow,
            color: AppColors.white,
            width: 30.r,
            height: 30.r,
          ),
        ),
      ),
    );
  }
}
