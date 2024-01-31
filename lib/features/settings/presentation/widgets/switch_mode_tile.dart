import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app/app_bloc.dart';
import '../../../../core/utils/assets/app_svg.dart';
import '../../../../generated/l10n.dart';
import 'settings_item_tile.dart';

class SwitchModeTile extends StatelessWidget {
  const SwitchModeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsItemTile(
      title: S.of(context).dark_mode,
      svgPath: AppSvg.darkMode,
      trailing: SizedBox(
        width: 66.w,
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return AnimatedToggleSwitch<AppTheme>.rolling(
              current: state.theme,
              values: AppTheme.values,
              onChanged: (value) {
                context.read<AppBloc>().add(ChangeAppState(theme: value));
              },
              height: 30.h,
              indicatorAppearingBuilder: (context, value, indicator) {
                return SvgPicture.asset(
                  AppSvg.ellipse,
                  color: AppColors.white,
                );
              },
              borderWidth: 3,
              customStyleBuilder: (context, local, global) {
                return ToggleStyle(
                  backgroundColor: AppColors.light,
                  borderColor: AppColors.black.withOpacity(.06),
                  indicatorColor: AppColors.white,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
