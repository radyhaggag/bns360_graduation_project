import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';


class SocialMediaListItems extends StatelessWidget {
  const SocialMediaListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BuildIcon(
          iconPath: AppSvg.facebook,
          onTap: () {
            launchUrl(Uri.parse("https://www.facebook.com/"));
          },
        ),
        25.horizontalSpace,
        _BuildIcon(
          iconPath: AppSvg.instagram,
          onTap: () {
            launchUrl(Uri.parse("https://www.instagram.com/"));
          },
        ),
      ],
    );
  }
}

class _BuildIcon extends StatelessWidget {
  const _BuildIcon({
    required this.iconPath,
    required this.onTap,
  });
  final String iconPath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        width: 35.r,
        height: 35.r,
      ),
    );
  }
}
