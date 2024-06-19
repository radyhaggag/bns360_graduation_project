import 'package:bns360_graduation_project/core/utils/enums/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../../core/utils/enums/work_days.dart';
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

    context.read<MyServicesBloc>().add(InitNetworkServiceImageEvent(
          networkImages: widget.craftsmanEntity.serviceImages,
          mainServiceImage: widget.craftsmanEntity.profileImageUrl,
        ));

    context.read<MyServicesBloc>().add(SelectServiceHolidayEvent(
          holiday: WorkDay.fromId(widget.craftsmanEntity.holidays),
        ));

    if (widget.craftsmanEntity.isWorking24Hour) {
      context.read<MyServicesBloc>().add(const SetIsAlwaysAvailableValueEvent(
            isAlwaysAvailable: true,
          ));
    }

    final phoneNumber = widget.craftsmanEntity.contact.phoneNumber;
    final phoneOne = phoneNumber?.contains("-") ?? false
        ? phoneNumber?.split("-")[0]
        : phoneNumber;

    final phoneTwo =
        phoneNumber?.contains("-") ?? false ? phoneNumber?.split("-")[1] : null;

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
          value: TimeDuration.convertTo12Format(
            widget.craftsmanEntity.opening,
          ).toString(),
        ),
        'to': FormControl<String>(
          validators: [
            Validators.required,
            Validators.number,
          ],
          value: TimeDuration.convertTo12Format(
            widget.craftsmanEntity.closing,
          ).toString(),
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
          validators: [Validators.email],
          value: widget.craftsmanEntity.contact.email,
        ),
        'url': FormControl<String>(
          value: widget.craftsmanEntity.contact.urlSite,
        ),
      },
    );

    form.valueChanges.listen((event) {
      final fromValue = form.controls['from']?.value ?? "0";
      final toValue = form.controls['to']?.value ?? "0";

      if (fromValue.toString().isNotEmpty) {
        final from = int.parse(fromValue.toString());
        if (from > 12) {
          form.controls['from']!.value = "12";
        }
        if (from == 0) {
          form.controls['from']!.value = "1";
        }
      }

      if (toValue.toString().isNotEmpty) {
        final to = int.parse(toValue.toString());

        if (to > 12) {
          form.controls['to']!.value = "12";
        }

        if (to == 0) {
          form.controls['to']!.value = "1";
        }
      }
    });
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyServicesBloc, MyServicesState>(
      listener: (context, state) {
        if (state is IsAlwaysWorkingToggledState && state.isAlwaysWorking) {
          form.controls['from']!.value = "0";
          form.controls['to']!.value = "24";
        }
      },
      child: SafeArea(
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
      ),
    );
  }
}
