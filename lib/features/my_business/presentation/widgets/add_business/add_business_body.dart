import 'package:bns360_graduation_project/core/helpers/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/enums/work_days.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/params/add_business_params.dart';
import '../../bloc/my_business_bloc.dart';
import '../submit_business_button.dart';
import '../upload_business_images_section.dart';
import 'add_business_form.dart';

class AddBusinessBody extends StatefulWidget {
  const AddBusinessBody({super.key});

  @override
  State<AddBusinessBody> createState() => _AddBusinessBodyState();
}

class _AddBusinessBodyState extends State<AddBusinessBody> {
  OfferType? selectedOfferType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();

    form = FormGroup({
      'name_ar': FormControl<String>(
        validators: [Validators.required],
      ),
      'description_ar': FormControl<String>(
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
        ],
      ),
      'phoneNumber2': FormControl<String>(),
      'email': FormControl<String>(
        validators: [Validators.email],
      ),
      'url': FormControl<String>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBusinessBloc, MyBusinessState>(
      listener: (context, state) {
        if (state is IsAlwaysWorkingToggledState && state.isAlwaysWorking) {
          form.controls['from']!.value = "0";
          form.controls['to']!.value = "24";
        }
      },
      child: Padding(
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
                  S.of(context).add_business,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.theme.cardColor,
                    fontSize: AppFontSize.titleMedium,
                  ),
                ),
              ),
              20.verticalSpace,
              AddBusinessForm(
                form: form,
              ),
              10.verticalSpace,
              const UploadMainBusinessImageSection(),
              10.verticalSpace,
              const UploadBusinessImagesSection(),
              20.verticalSpace,
              SubmitBusinessButton(
                onAdd: _submitForm,
                isUpdate: false,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;
    String phoneNumber = (formControls['phoneNumber']!.value as String);
    String? phoneNumber2 = formControls['phoneNumber2']!.value as String?;
    if ((phoneNumber2 ?? "").isNotEmpty) {
      phoneNumber += "-$phoneNumber2";
    }
    final params = AddBusinessParams(
      holiday: WorkDay.friday,
      businessName: formControls['name_ar']!.value as String,
      businessAddress: formControls['address']!.value as String,
      businessDescription: formControls['description_ar']!.value as String,
      to: int.parse(formControls['to']!.value as String),
      from: int.parse(formControls['from']!.value as String),
      phoneNumber: phoneNumber,
      mainBusinessBackgroundImages: [],
      // Will updated on the bloc
      mainBusinessImage: "", // Will updated on the bloc
      email: formControls['email']!.value as String?,
      siteUrl: formControls['url']!.value as String?,
    );

    if (params.from > params.to || params.from > 24 || params.to > 24) {
      showToast(
        S.of(context).invalid_time_range,
        ToastType.error,
      );
      return;
    }

    context.read<MyBusinessBloc>().add(AddBusinessEvent(
          addBusinessParams: params,
        ));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
