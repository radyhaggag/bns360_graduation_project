import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/utils/enums/user_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../generated/l10n.dart';
import 'profile_item_tile.dart';
import 'profile_sign_out_btn.dart';

class ProfileListItemsSection extends StatelessWidget {
  const ProfileListItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * .93,
      height: context.height * .55,
      // height: context.height * .65,
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
          if (AppProvider().getProfile()?.userType ==
              UserType.businessOwner.id) ...[
            ProfileItemTile(
              title: S.of(context).my_business,
              svgPath: AppSvg.business,
              size: 30.r,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.myBusiness);
              },
            ),
            const SizedBox(height: 10),
          ],
          if (AppProvider().getProfile()?.userType ==
              UserType.serviceProvider.id) ...[
            ProfileItemTile(
              title: S.of(context).my_services,
              svgPath: AppSvg.construction,
              size: 30.r,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.myServices);
              },
            ),
            const SizedBox(height: 10),
          ],
          ProfileItemTile(
            title: S.of(context).my_posts,
            svgPath: AppSvg.posts,
            size: 19.5.r,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.myPosts);
            },
          ),
          const SizedBox(height: 10),
          ProfileItemTile(
            title: S.of(context).saved,
            icon: Icons.bookmark,
            size: 30.r,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.savedItems);
            },
          ),
          const SizedBox(height: 10),
          ProfileItemTile(
            title: S.of(context).share_this_app,
            svgPath: AppSvg.share,
            size: 25.r,
            onTap: () {},
          ),
          const SizedBox(height: 10),
          const ProfileSignOutBtn(),
        ],
      ),
    );
  }
}
