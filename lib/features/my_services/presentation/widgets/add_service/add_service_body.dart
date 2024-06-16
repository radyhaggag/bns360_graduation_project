import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/helpers/validators/form_validators.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/work_days.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/strings.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/params/add_service_params.dart';
import '../../bloc/my_services_bloc.dart';
import '../submit_service_button.dart';
import '../upload_service_images_section.dart';
import 'add_service_form.dart';

class AddServiceBody extends StatefulWidget {
  const AddServiceBody({super.key});

  @override
  State<AddServiceBody> createState() => _AddServiceBodyState();
}

class _AddServiceBodyState extends State<AddServiceBody> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();

    form = FormGroup({
      'name': FormControl<String>(
        validators: [Validators.required],
      ),
      'description': FormControl<String>(
        validators: [Validators.required],
      ),
      'address': FormControl<String>(
        validators: [Validators.required],
      ),
      'from': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'to': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
      ),
      'phoneNumber2': FormControl<String>(
        validators: [
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
      ),
      "email": FormControl<String>(
        validators: [Validators.email],
      ),
      'url': FormControl<String>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, formGroup, child) => child!,
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(
                S.of(context).add_service,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.theme.cardColor,
                  fontSize: AppFontSize.titleMedium,
                ),
              ),
            ),
            20.verticalSpace,
            AddServiceForm(
              form: form,
            ),
            10.verticalSpace,
            const UploadMainServiceImageSection(),
            10.verticalSpace,
            const UploadServiceImagesSection(),
            20.verticalSpace,
            SubmitServiceButton(
              onAdd: _submitForm,
              isUpdate: false,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;

    String phoneNumber =
        (formControls['phoneNumber']!.value as String).withCountryCode;
    String? phoneNumber2 = formControls['phoneNumber2']!.value as String?;
    if (phoneNumber2 != null) {
      phoneNumber += "-${phoneNumber2.withCountryCode}";
    }

    final params = AddServiceParams(
      holiday: WorkDay.friday,
      serviceName: formControls['name']!.value as String,
      serviceAddress: formControls['address']!.value as String,
      serviceDescription: formControls['description']!.value as String,
      to: int.parse(formControls['to']!.value as String),
      from: int.parse(formControls['from']!.value as String),
      phoneNumber: phoneNumber,
      mainServiceBackgroundImages: [], // Will updated on the bloc
      mainServiceImage: "", // Will updated on the bloc
      email: formControls['email']!.value as String?,
      siteUrl: formControls['url']!.value as String,
    );
    context.read<MyServicesBloc>().add(AddServiceEvent(
          addServiceParams: params,
        ));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
