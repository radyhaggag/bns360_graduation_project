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
import '../../../domain/params/add_business_params.dart';
import '../../bloc/my_business_bloc.dart';
import 'add_business_form.dart';
import 'submit_business_button.dart';
import 'upload_business_images_section.dart';

class AddBusinessBody extends StatefulWidget {
  const AddBusinessBody({super.key, this.categoryItemEntity});

  final CategoryItemEntity? categoryItemEntity;

  @override
  State<AddBusinessBody> createState() => _AddBusinessBodyState();
}

class _AddBusinessBodyState extends State<AddBusinessBody> {
  OfferType? selectedOfferType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();

    if (widget.categoryItemEntity != null) {
      context.read<MyBusinessBloc>().add(InitNetworkBusinessImageEvent(
            networkImages: widget.categoryItemEntity!.albumUrls,
            mainBusinessImage: widget.categoryItemEntity!.profilePictureUrl,
          ));
      context.read<MyBusinessBloc>().add(SelectBusinessCategoryEvent(
            categoryId: widget.categoryItemEntity!.categoryId,
          ));
    }

    form = FormGroup({
      'name_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity?.nameAR,
      ),
      'name_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity?.nameENG,
      ),
      'description_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity?.aboutAR,
      ),
      'description_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity?.aboutENG,
      ),
      'address': FormControl<String>(
        validators: [Validators.required],
        value: widget.categoryItemEntity?.address,
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
                widget.categoryItemEntity != null
                    ? S.of(context).edit_business
                    : S.of(context).add_business,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.theme.cardColor,
                  fontSize: AppFontSize.titleMedium,
                ),
              ),
            ),
            20.verticalSpace,
            AddBusinessForm(
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
              isUpdate: widget.categoryItemEntity != null,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;
    final params = AddBusinessParams(
      businessName: formControls['name_ar']!.value as String,
      businessAddress: formControls['address']!.value as String,
      businessDescription: formControls['description_ar']!.value as String,
      to: int.parse(formControls['to']!.value as String),
      from: int.parse(formControls['from']!.value as String),
      phoneNumber: formControls['phoneNumber']!.value as String,
      mainBusinessBackgroundImages: [], // Will updated on the bloc
      mainBusinessImage: "", // Will updated on the bloc
    );

    if (widget.categoryItemEntity == null) {
      context.read<MyBusinessBloc>().add(AddBusinessEvent(
            addBusinessParams: params,
          ));
    } else {
      final entity = widget.categoryItemEntity!.copyWith(
        nameAR: formControls['name_ar']!.value as String,
        nameENG: formControls['name_eng']!.value as String,
        address: formControls['address']!.value as String,
        aboutAR: formControls['description_ar']!.value as String,
        aboutENG: formControls['description_eng']!.value as String,
        workStartHour: int.parse(formControls['from']!.value as String),
        workEndHour: int.parse(formControls['to']!.value as String),
        contacts: widget.categoryItemEntity?.contacts.copyWith(
          phoneNumbers: [
            formControls['phoneNumber']!.value as String,
          ],
        ),
      );
      context.read<MyBusinessBloc>().add(UpdateBusinessEvent(
            categoryItemEntity: entity,
          ));
    }
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
