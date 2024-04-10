import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/profile/profile_entity.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/input_fields/edit_input_field.dart';
import '../../../../../generated/l10n.dart';
import 'edit_profile_data_btn.dart';

class EditProfileBottomSection extends StatefulWidget {
  const EditProfileBottomSection({super.key});

  @override
  State<EditProfileBottomSection> createState() =>
      _EditProfileBottomSectionState();
}

class _EditProfileBottomSectionState extends State<EditProfileBottomSection> {
  late final FormGroup form;
   ProfileEntity? profile;

  @override
  void initState() {
    super.initState();
     profile = AppProvider().getProfile();
    form = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
        value: profile?.email,
      ),
      'name': FormControl<String>(
        validators: [Validators.required],
        value: profile?.name,
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    print(profile);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: context.theme.scaffoldBackgroundColor,
      ),
      padding: EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        top: 40.h,
        bottom: 70.h,
      ),
      width: context.width,
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, formGroup, child) => child!,
        child: Column(
          children: [
            EditInputField(
              label: S.of(context).user_name,
              formControlName: 'name',
              suffixIcon: SvgPicture.asset(
                AppSvg.edit,
                fit: BoxFit.scaleDown,
                color: context.theme.hoverColor,
              ),
              fontSize: AppFontSize.subTitle,
              heightBetweenLabelAndField: 15,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 30),
            EditInputField(
              label: S.of(context).email,
              formControlName: 'email',
              suffixIcon: SvgPicture.asset(
                AppSvg.edit,
                fit: BoxFit.scaleDown,
                color: context.theme.hoverColor,
              ),
              fontSize: AppFontSize.subTitle,
              heightBetweenLabelAndField: 15,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 30),
            const Spacer(),
            const EditProfileDataBtn(),
          ],
        ),
      ),
    );
  }
}
