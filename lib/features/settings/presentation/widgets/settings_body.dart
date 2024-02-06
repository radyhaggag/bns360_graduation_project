import 'package:bns360_graduation_project/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/utils/assets/app_svg.dart';
import '../../../../generated/l10n.dart';
import 'language_bottom_sheet/change_language_bottom_sheet.dart';
import 'log_out_btn.dart';
import 'settings_item_tile.dart';
import 'settings_section_tile.dart';
import 'switch_mode_tile.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          SettingsSectionTile(
            title: S.of(context).account,
          ),
          SettingsItemTile(
            title: S.of(context).edit_profile,
            svgPath: AppSvg.profileVector,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.editProfile);
            },
          ),
          SettingsItemTile(
            title: S.of(context).change_password,
            svgPath: AppSvg.key,
            onTap: () {},
          ),
          SettingsSectionTile(
            title: S.of(context).app_settings,
          ),
          SettingsItemTile(
            title: S.of(context).language,
            svgPath: AppSvg.language,
            onTap: () {
              ChangeLanguageBottomSheet.show(
                context: context,
                settingsBloc: context.read<SettingsBloc>(),
              );
            },
          ),
          const SwitchModeTile(),
          SettingsSectionTile(
            title: S.of(context).support,
          ),
          SettingsItemTile(
            title: S.of(context).terms_of_service,
            svgPath: AppSvg.termsOfService,
            onTap: () {},
          ),
          SettingsItemTile(
            title: S.of(context).contact_us,
            svgPath: AppSvg.message,
            onTap: () {},
          ),
          SettingsItemTile(
            title: S.of(context).privacy_policy,
            svgPath: AppSvg.privacyTip,
            onTap: () {},
          ),
          SettingsItemTile(
            title: S.of(context).about_us,
            svgPath: AppSvg.aboutCircle,
            onTap: () {},
          ),
          const LogOutBtn(),
        ],
      ),
    );
  }
}
