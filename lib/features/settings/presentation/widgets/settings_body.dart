import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';
import 'settings_item_tile.dart';
import 'settings_section_tile.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          const SettingsSectionTile(title: 'Account'),
          SizedBox(height: 8.h),
          const SettingsItemTile(
            title: 'Edit Profile',
            svgPath: AppSvg.profileVector,
          ),
          const SettingsItemTile(
            title: 'Change password',
            svgPath: AppSvg.key,
          ),
          const SettingsSectionTile(title: 'App settings'),
          SizedBox(height: 8.h),
          const SettingsItemTile(
            title: 'Language',
            svgPath: AppSvg.language,
          ),
          SettingsItemTile(
            title: 'Dark mode',
            svgPath: AppSvg.darkMode,
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          const SettingsSectionTile(title: 'Support'),
          SizedBox(height: 8.h),
          const SettingsItemTile(
            title: 'Terms of service',
            svgPath: AppSvg.termsOfService,
          ),
          const SettingsItemTile(
            title: 'Contact Us',
            svgPath: AppSvg.message,
          ),
          const SettingsItemTile(
            title: 'Privacy policy',
            svgPath: AppSvg.privacyTip,
          ),
          const SettingsItemTile(
            title: 'About Us',
            svgPath: AppSvg.aboutCircle,
          ),
        ],
      ),
    );
  }
}
