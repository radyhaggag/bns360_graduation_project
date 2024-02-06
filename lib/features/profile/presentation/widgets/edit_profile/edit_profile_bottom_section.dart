import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/input_fields/edit_input_field.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/profile_bloc.dart';
import 'edit_profile_data_btn.dart';

class EditProfileBottomSection extends StatelessWidget {
  const EditProfileBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Theme.of(context).highlightColor,
      ),
      padding: EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        top: 40.h,
        bottom: 70.h,
      ),
      width: context.width,
      child: Column(
        children: [
          EditInputField(
            label: S.of(context).user_name,
            controller: profileBloc.nameController,
            suffixIcon: SvgPicture.asset(
              AppSvg.edit,
              fit: BoxFit.scaleDown,
            ),
            fontSize: AppFontSize.subTitle,
            heightBetweenLabelAndField: 15,
          ),
          const SizedBox(height: 30),
          EditInputField(
            label: S.of(context).email,
            controller: profileBloc.emailController,
            suffixIcon: SvgPicture.asset(
              AppSvg.edit,
              fit: BoxFit.scaleDown,
            ),
            fontSize: AppFontSize.subTitle,
            heightBetweenLabelAndField: 15,
          ),
          const SizedBox(height: 30),
          const Spacer(),
          const EditProfileDataBtn(),
        ],
      ),
    );
  }
}
