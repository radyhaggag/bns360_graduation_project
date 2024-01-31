import '../../../../core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/app_bloc.dart';
import '../../../../core/extensions/media_query.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: _mainColor(context),
            ),
      ),
    );
  }

  Color _mainColor(context) {
    return Theme.of(context).primaryColor.withOpacity(.25);
  }
}
