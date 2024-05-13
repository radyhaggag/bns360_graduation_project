import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/input_fields/custom_reactive_input_field.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';

class AddRequirementDialog extends StatefulWidget {
  const AddRequirementDialog({
    super.key,
    required this.onAdd,
    this.initialValue,
  });

  final void Function(String)? onAdd;
  final String? initialValue;

  static show({
    required BuildContext context,
    required void Function(String)? onAdd,
    String? initialValue,
  }) {
    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (_) => AddRequirementDialog(
        onAdd: onAdd,
        initialValue: initialValue,
      ),
    );
  }

  @override
  State<AddRequirementDialog> createState() => _AddRequirementDialogState();
}

class _AddRequirementDialogState extends State<AddRequirementDialog> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();

    form = FormGroup({
      'requirement': FormControl<String>(
        validators: [Validators.required],
        value: widget.initialValue,
      ),
    });
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: AlertDialog(
        backgroundColor: context.theme.highlightColor,
        contentPadding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 20.h,
        ),
        content: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 10),
          child: CustomReactiveFormField(
            formControlName: "requirement",
            maxLines: 5,
            textInputAction: TextInputAction.done,
            hint: S.of(context).add_requirement,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          ReactiveFormConsumer(
            builder: (context, form, child) => CustomElevatedButton(
              onPressed: form.valid
                  ? () {
                      final requirement =
                          form.findControl("requirement")?.value;
                      widget.onAdd?.call(requirement);
                      Navigator.pop(context);
                    }
                  : null,
              label: widget.initialValue != null
                  ? S.of(context).edit
                  : S.of(context).add,
              width: 100.w,
              height: 35.h,
            ),
          ),
          CustomOutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            label: S.of(context).cancel,
            width: 100.w,
            height: 35.h,
            backgroundColor: Colors.transparent,
            foregroundColor: context.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
