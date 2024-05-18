import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../bloc/settings_bloc.dart';

class LanguageItemTile extends StatelessWidget {
  const LanguageItemTile({
    super.key,
    required this.language,
  });

  final Language language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) {
        return current is LanguageSelectedState;
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<SettingsBloc>().add(SelectLanguageToChangeEvent(
                  language: language,
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: context.theme.listTileTheme.tileColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 15,
            ),
            height: 45.h,
            width: context.width,
            alignment: Alignment.center,
            child: Directionality(
              textDirection: language == Language.arabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    language.message,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: AppFontSize.details,
                    ),
                  ),
                  if (language == context.read<SettingsBloc>().selectedLanguage)
                    SvgPicture.asset(
                      AppSvg.check,
                      fit: BoxFit.cover,
                      height: 35.r,
                      width: 35.r,
                      alignment: Alignment.center,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
