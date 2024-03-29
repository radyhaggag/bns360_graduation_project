import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app/app_bloc.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions/media_query.dart';

class SettingsSectionTile extends StatelessWidget {
  const SettingsSectionTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: context.width,
      height: 40.h,
      alignment: LocalizationHelper.currentLanguage == Language.english
          ? Alignment.centerLeft
          : Alignment.centerRight,
      decoration: BoxDecoration(
        color: context.read<AppBloc>().state.theme == AppTheme.light
            ? AppColors.white
            : AppColors.black,
      ),
      child: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          color: _mainColor(context),
        ),
      ),
    );
  }

  Color _mainColor(BuildContext context) {
    return context.theme.cardColor;
  }
}
