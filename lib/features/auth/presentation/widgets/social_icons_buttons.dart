import 'dart:developer';

import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utils/assets/app_images.dart';

class SocialIconsButtons extends StatelessWidget {
  const SocialIconsButtons({super.key});

  ButtonStyle mainStyle(BuildContext context) => IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: context.theme.hintColor.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            await GoogleSignIn().signOut();
            final user = await GoogleSignIn().signIn();
            log(user.toString());
          },
          style: mainStyle(context),
          icon: Image.asset(
            AppImages.googleIcon,
            width: 45.w,
            height: 45.h,
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          style: mainStyle(context),
          icon: Image.asset(
            AppImages.facebook,
            width: 45.w,
            height: 45.h,
          ),
        ),
      ],
    );
  }
}
