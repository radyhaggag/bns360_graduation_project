import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app/app_bloc.dart';
import '../../../../../core/utils/extensions/language.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/settings_bloc.dart';

class ChangeLanguageBtn extends StatelessWidget {
  const ChangeLanguageBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();
    return ValueListenableBuilder(
      valueListenable: settingsBloc.isLanguageChanged,
      builder: (context, value, child) {
        return CustomElevatedButton(
          label: S.of(context).change,
          width: 150.w,
          onPressed: settingsBloc.isLanguageChanged.value &&
                  settingsBloc.selectedLanguage != null
              ? () {
                  context.read<AppBloc>().add(ChangeAppState(
                        locale: settingsBloc.selectedLanguage!.locale,
                      ));
                  settingsBloc.add(ChangeAppLanguageEvent());
                  Navigator.pop(context);
                }
              : null,
          
        );
      },
    );
  }
}
