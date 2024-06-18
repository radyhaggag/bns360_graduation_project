import 'package:bns360_graduation_project/core/helpers/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/enums/work_days.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/my_business_bloc.dart';
import '../submit_business_button.dart';
import '../upload_business_images_section.dart';
import 'edit_business_form.dart';

class EditBusinessBody extends StatefulWidget {
  const EditBusinessBody({super.key, required this.categoryItemEntity});

  final CategoryItemEntity categoryItemEntity;

  @override
  State<EditBusinessBody> createState() => _EditBusinessBodyState();
}

class _EditBusinessBodyState extends State<EditBusinessBody> {
  OfferType? selectedOfferType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();

    // because the update cannot be done now without updating the images

    // context.read<MyBusinessBloc>().add(InitNetworkBusinessImageEvent(
    //       networkImages: widget.categoryItemEntity.businessImages,
    //       mainBusinessImage: widget.categoryItemEntity.profileImageName,
    //     ));

    context.read<MyBusinessBloc>().add(SelectBusinessHolidayEvent(
          holiday: WorkDay.fromId(widget.categoryItemEntity.holidays),
        ));

    context.read<MyBusinessBloc>().add(SelectBusinessLocationEvent(
          lat: widget.categoryItemEntity.latitude,
          lng: widget.categoryItemEntity.longitude,
        ));

    if (widget.categoryItemEntity.isWorking24Hour) {
      context.read<MyBusinessBloc>().add(const SetIsAlwaysAvailableValueEvent(
            isAlwaysAvailable: true,
          ));
    }

    final phoneNumber = widget.categoryItemEntity.contacts.phoneNumber;
    final phoneOne = phoneNumber?.contains("-") ?? false
        ? phoneNumber?.split("-")[0]
        : phoneNumber;

    final phoneTwo =
        phoneNumber?.contains("-") ?? false ? phoneNumber?.split("-")[1] : null;

    form = FormGroup({
      'name_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity.businessNameArabic,
      ),
      'name_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity.businessNameEnglish,
      ),
      'description_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity.businessDescriptionArabic,
      ),
      'description_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity.businessDescriptionEnglish,
      ),
      'address_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity.businessAddressArabic,
      ),
      'address_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity.businessAddressEnglish,
      ),
      'from': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
        value: widget.categoryItemEntity.opening.toString(),
      ),
      'to': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
        value: widget.categoryItemEntity.closing.toString(),
      ),
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
        value: phoneOne,
      ),
      'phoneNumber2': FormControl<String>(
        value: phoneTwo,
      ),
      'email': FormControl<String>(
        value: widget.categoryItemEntity.contacts.email,
      ),
      'url': FormControl<String>(
        value: widget.categoryItemEntity.contacts.urlSite,
      ),
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
                  S.of(context).edit_business,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.theme.cardColor,
                    fontSize: AppFontSize.titleMedium,
                  ),
                ),
              ),
              20.verticalSpace,
              EditBusinessForm(
                form: form,
                categoryItemEntity: widget.categoryItemEntity,
              ),
              10.verticalSpace,
              const UploadMainBusinessImageSection(),
              10.verticalSpace,
              const UploadBusinessImagesSection(),
              20.verticalSpace,
              SubmitBusinessButton(
                onAdd: _submitForm,
                isUpdate: true,
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

    String phoneNumber =
        (formControls['phoneNumber']!.value as String);
    String? phoneNumber2 = formControls['phoneNumber2']!.value as String?;
    if ((phoneNumber2 ?? "").isNotEmpty) {
      phoneNumber += "-$phoneNumber2";
    }

    final entity = widget.categoryItemEntity.copyWith(
      businessNameArabic: formControls['name_ar']!.value as String,
      businessNameEnglish: formControls['name_eng']!.value as String,
      businessAddressArabic: formControls['address_ar']!.value as String,
      businessAddressEnglish: formControls['address_eng']!.value as String,
      businessDescriptionArabic:
          formControls['description_ar']!.value as String,
      businessDescriptionEnglish:
          formControls['description_eng']!.value as String,
      opening: int.parse(formControls['from']!.value as String),
      closing: int.parse(formControls['to']!.value as String),
      contacts: widget.categoryItemEntity.contacts.copyWith(
        phoneNumber: phoneNumber,
        email: formControls['email']!.value as String?,
        urlSite: formControls['url']!.value as String?,
      ),
    );

    if ((entity.opening > entity.closing) ||
        entity.opening > 24 ||
        entity.closing > 24) {
      showToast(
        S.of(context).invalid_time_range,
        ToastType.error,
      );
      return;
    }

    context.read<MyBusinessBloc>().add(UpdateBusinessEvent(
          categoryItemEntity: entity,
        ));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
