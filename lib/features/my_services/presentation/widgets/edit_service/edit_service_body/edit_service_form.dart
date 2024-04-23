import 'package:bns360_graduation_project/core/shared_data/entities/craftsman_entity.dart';
import 'package:bns360_graduation_project/core/widgets/input_fields/custom_reactive_input_field.dart';
import 'package:bns360_graduation_project/core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import 'package:bns360_graduation_project/features/my_services/domain/params/add_service_params.dart';
import 'package:bns360_graduation_project/features/my_services/presentation/widgets/add_service/add_service_time_section.dart';
import 'package:bns360_graduation_project/features/my_services/presentation/widgets/add_service/service_type_dropdown.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../bloc/my_services_bloc.dart';
import '../../submit_service_button.dart';
import '../../upload_service_images_section.dart';

class EditServiceForm extends StatelessWidget {
  const EditServiceForm({
    super.key,
    required this.craftsmanEntity,
    required this.form,
  });

  final CraftsmanEntity craftsmanEntity;
  final FormGroup form;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveFormField(
            title: t.user_name,
            hint: t.enterName,
            formControlName: 'name',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          const ServiceTypeDropdown(),
          15.verticalSpace,
          CustomReactiveFormField(
            title: t.description,
            hint: "${t.enter} ${t.description}",
            formControlName: 'description',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.your_address,
            hint: t.enter_service_address,
            formControlName: 'address',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          const WhatsappAndMobileFields(
            viewWhatsapp: false,
          ),
          15.verticalSpace,
          const AddServiceTimeSection(),
          const SizedBox(height: 10),
          const UploadServiceImagesSection(),
          const SizedBox(height: 25),
          SubmitServiceButton(
            onAdd: () => _submitForm(context),
            isUpdate: true,
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    final formControls = form.controls;
    final params = AddServiceParams(
      serviceName: formControls['name']!.value as String,
      serviceAddress: formControls['address']!.value as String,
      serviceDescription: formControls['description']!.value as String,
      to: int.parse(formControls['to']!.value as String),
      from: int.parse(formControls['from']!.value as String),
      phoneNumber: formControls['phoneNumber']!.value as String,
      mainServiceBackgroundImages: [], // Will updated on the bloc
      mainServiceImage: "", // Will updated on the bloc
    );
    context.read<MyServicesBloc>().add(AddServiceEvent(
          addServiceParams: params,
        ));
  }
}
