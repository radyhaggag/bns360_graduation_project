import 'package:bns360_graduation_project/features/map/domain/params/map_params.dart';
import 'package:bns360_graduation_project/features/map/presentation/screens/map_screen.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/bloc/my_business_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../core/widgets/select_holiday_dropdown.dart';
import '../../../../../generated/l10n.dart';
import '../add_business_time_section.dart';
import '../business_type_dropdown.dart';

class AddBusinessForm extends StatelessWidget {
  const AddBusinessForm({
    super.key,
    required this.form,
    this.categoryItemEntity,
  });

  final FormGroup form;
  final CategoryItemEntity? categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveFormField(
            title: t.business_name,
            hint: t.enter_business_name,
            formControlName: 'name_ar',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          if (categoryItemEntity != null) ...[
            CustomReactiveFormField(
              title: t.business_name,
              hint: t.enter_business_name,
              formControlName: 'name_eng',
              textInputAction: TextInputAction.next,
            ),
            15.verticalSpace,
          ],
          const BusinessTypeDropdown(),
          15.verticalSpace,
          CustomReactiveFormField(
            title: t.description_of_business,
            hint: "${t.enter} ${t.description_of_business}",
            formControlName: 'description_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          if (categoryItemEntity != null) ...[
            CustomReactiveFormField(
              title: t.business_name,
              hint: t.enter_business_name,
              formControlName: 'description_eng',
              textInputAction: TextInputAction.next,
            ),
            15.verticalSpace,
          ],
          CustomReactiveFormField(
            title: t.business_address,
            hint: t.enter_business_address,
            formControlName: 'address',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          BlocBuilder<MyBusinessBloc, MyBusinessState>(
            builder: (context, state) {
              final bloc = context.read<MyBusinessBloc>();
              return MapScreen(
                mapParams: MapParams(
                  isMinimized: true,
                  lat: bloc.businessLat,
                  lng: bloc.businessLng,
                  onTap: (lat, lng) {
                    context.read<MyBusinessBloc>().add(
                          SelectBusinessLocationEvent(
                            lat: lat,
                            lng: lng,
                          ),
                        );
                  },
                ),
              );
            },
          ),
          15.verticalSpace,
          const WhatsappAndMobileFields(
            viewWhatsapp: false,
          ),
          15.verticalSpace,
          const AddBusinessTimeSection(),
          15.verticalSpace,
          SelectHolidayDropdown(
            onChange: (holiday) {
              context.read<MyBusinessBloc>().add(
                    SelectBusinessHolidayEvent(holiday: holiday),
                  );
            },
          ),
        ],
      ),
    );
  }
}
