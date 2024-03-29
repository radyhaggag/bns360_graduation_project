import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../generated/l10n.dart';
import 'profile_item_tile.dart';

class ProfileListItemsSection extends StatelessWidget {
  const ProfileListItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * .93,
      height: context.height * .45,
      padding: EdgeInsetsDirectional.only(start: 6.w, top: 12.h),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileItemTile(
            title: S.of(context).settings,
            svgPath: AppSvg.settings,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.settings);
            },
          ),
          const SizedBox(height: 10),
          ProfileItemTile(
            title: S.of(context).favorites,
            svgPath: AppSvg.favorite,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.favorites);
            },
          ),
          const SizedBox(height: 10),
          ProfileItemTile(
            title: S.of(context).my_posts,
            svgPath: AppSvg.posts,
            size: 19.5.r,
            onTap: () {},
          ),
          const SizedBox(height: 10),
          ProfileItemTile(
            title: S.of(context).share_this_app,
            svgPath: AppSvg.share,
            onTap: () {},
          ),
          const SizedBox(height: 10),
          const LogoutTile(),
        ],
      ),
    );
  }
}
