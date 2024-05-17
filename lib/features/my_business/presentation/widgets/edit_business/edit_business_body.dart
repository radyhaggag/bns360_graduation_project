import 'package:bns360_graduation_project/core/helpers/validators/form_validators.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
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

    context.read<MyBusinessBloc>().add(InitNetworkBusinessImageEvent(
          networkImages: widget.categoryItemEntity.businessImages,
          mainBusinessImage: widget.categoryItemEntity.profileImageName,
        ));
    context.read<MyBusinessBloc>().add(SelectBusinessCategoryEvent(
          categoryId: widget.categoryItemEntity.categoriesModelId,
        ));

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
    );
  }

  void _submitForm() {
    final formControls = form.controls;
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
        phoneNumber: formControls['phoneNumber']!.value as String,
      ),
    );
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
