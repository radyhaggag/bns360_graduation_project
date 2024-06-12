import '../../../../../../core/utils/enums/work_days.dart';
import '../../../../../../core/utils/extensions/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../core/helpers/validators/form_validators.dart';
import '../../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../bloc/my_services_bloc.dart';
import '../craftsman_head/edit_craftsman_head_sliver.dart';
import 'edit_service_form.dart';

class EditServiceBody extends StatefulWidget {
  const EditServiceBody({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  State<EditServiceBody> createState() => _EditServiceBodyState();
}

class _EditServiceBodyState extends State<EditServiceBody> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();

    // context.read<MyServicesBloc>().add(InitNetworkServiceImageEvent(
    //       networkImages: widget.craftsmanEntity.serviceImages,
    //       mainServiceImage: widget.craftsmanEntity.profileImageUrl,
    //     ));

    context.read<MyServicesBloc>().add(SelectServiceHolidayEvent(
          holiday: WorkDay.fromId(widget.craftsmanEntity.holidays),
        ));

    form = FormGroup(
      {
        'name_ar': FormControl<String>(
          validators: [Validators.required],
          value: widget.craftsmanEntity.nameAR,
        ),
        'name_en': FormControl<String>(
          validators: [Validators.required],
          value: widget.craftsmanEntity.nameEN,
        ),
        'description_ar': FormControl<String>(
          validators: [Validators.required],
          value: widget.craftsmanEntity.descriptionAR,
        ),
        'description_en': FormControl<String>(
          validators: [Validators.required],
          value: widget.craftsmanEntity.descriptionEN,
        ),
        'address_ar': FormControl<String>(
          validators: [Validators.required],
          value: widget.craftsmanEntity.addressAR,
        ),
        'address_en': FormControl<String>(
          validators: [Validators.required],
          value: widget.craftsmanEntity.addressEN,
        ),
        'from': FormControl<String>(
          validators: [
            Validators.required,
            Validators.number,
          ],
          value: widget.craftsmanEntity.opening.toString(),
        ),
        'to': FormControl<String>(
          validators: [
            Validators.required,
            Validators.number,
          ],
          value: widget.craftsmanEntity.closing.toString(),
        ),
        'phoneNumber': FormControl<String>(
          validators: [
            Validators.required,
            Validators.number,
            Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
          ],
          value: widget.craftsmanEntity.contact.phoneNumber.withoutCountryCode,
        ),
      },
    );
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ReactiveForm(
        formGroup: form,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: EditCraftsmanHeadSliver(
                craftsmanEntity: widget.craftsmanEntity,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    EditServiceForm(
                      craftsmanEntity: widget.craftsmanEntity,
                      form: form,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
