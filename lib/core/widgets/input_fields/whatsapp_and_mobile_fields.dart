import 'package:bns360_graduation_project/core/helpers/validators/form_validators.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_reactive_input_field.dart';

class WhatsappAndMobileFields extends StatelessWidget {
  const WhatsappAndMobileFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomReactiveFormField(
          title: S.of(context).phoneNumber,
          prefixText: "+20 ",
          hint: "+20 ",
          formControlName: 'phoneNumber',
          isHorizontally: true,
          keyboardType: TextInputType.number,
          isDigitsOnly: true,
          textFieldWidth: .5.sw,
          textStyle: context.textTheme.bodyMedium,
          maxLength: 10,
          textInputAction: TextInputAction.next,
          validationMessages: FormValidator.validationMessages(context, isPhoneNumber: true),
        ),
        10.verticalSpace,
        CustomReactiveFormField(
          title: S.of(context).whatsapp,
          prefixText: "+20 ",
          hint: "+20 ",
          formControlName: 'whatsapp',
          isHorizontally: true,
          keyboardType: TextInputType.number,
          isDigitsOnly: true,
          textFieldWidth: .5.sw,
          textStyle: context.textTheme.bodyMedium,
          maxLength: 10,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
