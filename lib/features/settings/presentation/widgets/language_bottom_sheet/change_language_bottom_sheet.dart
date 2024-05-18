import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/settings_bloc.dart';
import 'change_language_btn.dart';
import 'language_item_tile.dart';

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({super.key});

  static show({
    required BuildContext context,
    required SettingsBloc settingsBloc,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => BlocProvider.value(
        value: settingsBloc,
        child: BottomSheet(
            onClosing: () {},
            enableDrag: false,
            builder: (BuildContext context) {
              return const ChangeLanguageBottomSheet();
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 25.h,
      ),
      width: context.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).change_language,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: AppFontSize.body,
            ),
          ),
          const SizedBox(height: 30),
          ...List.generate(Language.values.length, (index) {
            return LanguageItemTile(
              language: Language.values[index],
            );
          }),
          const SizedBox(height: 15),
          const ChangeLanguageBtn(),
        ],
      ),
    );
  }
}
