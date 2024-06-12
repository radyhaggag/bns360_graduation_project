import '../../bloc/my_services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../core/widgets/select_holiday_dropdown.dart';
import '../../../../../generated/l10n.dart';
import '../service_type_dropdown.dart';
import 'add_service_time_section.dart';

class AddServiceForm extends StatelessWidget {
  const AddServiceForm({
    super.key,
    required this.form,
  });

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
          15.verticalSpace,
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
          15.verticalSpace,
          SelectHolidayDropdown(
            onChange: (holiday) {
              context.read<MyServicesBloc>().add(
                    SelectServiceHolidayEvent(holiday: holiday),
                  );
            },
          ),
        ],
      ),
    );
  }
}
