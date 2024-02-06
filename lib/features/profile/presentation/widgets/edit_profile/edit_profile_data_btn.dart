import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/profile_bloc.dart';

class EditProfileDataBtn extends StatelessWidget {
  const EditProfileDataBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.read<ProfileBloc>().isFormEdited,
      builder: (BuildContext context, value, Widget? child) {
        return CustomElevatedButton(
          label: S.of(context).save,
          width: 100.w,
          onPressed: value
              ? () {
                  context.read<ProfileBloc>().add(EditProfileDataEvent());
                }
              : null,
        );
      },
    );
  }
}
