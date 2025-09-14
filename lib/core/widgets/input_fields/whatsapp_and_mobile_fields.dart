import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../helpers/validators/form_validators.dart';
import '../../utils/extensions/context.dart';
import 'custom_reactive_input_field.dart';

class WhatsappAndMobileFields extends StatelessWidget {
  const WhatsappAndMobileFields({
    super.key,
    this.viewWhatsapp = true,
    this.withTwoPhoneNumbers = false,
  });

  final bool viewWhatsapp;
  final bool withTwoPhoneNumbers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomReactiveFormField(
          title: S.of(context).phoneNumber,
          // prefixText: "+20 ",
          hint: S.of(context).enterPhoneNumber,
          formControlName: 'phoneNumber',
          isHorizontally: false,
          keyboardType: TextInputType.number,
          isDigitsOnly: true,
          textStyle: context.textTheme.bodyMedium,
          // maxLength: 10,
          textInputAction: TextInputAction.next,
          validationMessages:
              FormValidator.validationMessages(context, isPhoneNumber: true),
        ),
        if (withTwoPhoneNumbers) ...[
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${S.of(context).phoneNumber} 2 (${S.of(context).optional})",
            hint: S.of(context).enterPhoneNumber,
            formControlName: 'phoneNumber2',
            isHorizontally: false,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            textStyle: context.textTheme.bodyMedium,
            // maxLength: 10,
            textInputAction: TextInputAction.next,
            validationMessages: FormValidator.validationMessages(
              context,
              isPhoneNumber: true,
            ),
          ),
        ],
        if (viewWhatsapp) ...[
          10.verticalSpace,
          CustomReactiveFormField(
            title: S.of(context).whatsapp,
            hint: S.of(context).enterPhoneNumber,
            formControlName: 'whatsapp',
            isHorizontally: false,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            // textFieldWidth: .5.sw,
            textStyle: context.textTheme.bodyMedium,
            // maxLength: 10,
            textInputAction: TextInputAction.done,
          ),
        ],
      ],
    );
  }
}
