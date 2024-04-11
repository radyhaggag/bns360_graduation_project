import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../utils/enums.dart';
import '../../utils/extensions/language.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  const PhoneInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "${S.of(context).phoneNumber} (${S.of(context).optional})",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.theme.primaryColor.withOpacity(.6),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              SizedBox(
                width: 70,
                child: TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: '+20',
                    // hintStyle: AppStyles.getRegularStyle(),
                    helperText: "",
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  textAlign: context.currentLanguage == Language.english
                      ? TextAlign.start
                      : TextAlign.end,
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: S.of(context).enterPhoneNumber,
                    helperText: "",
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
