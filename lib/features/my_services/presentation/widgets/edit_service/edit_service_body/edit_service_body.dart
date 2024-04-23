import 'package:bns360_graduation_project/core/helpers/validators/form_validators.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/craftsman_entity.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

    form = FormGroup({
      'name': FormControl<String>(
        validators: [Validators.required],
        value: widget.craftsmanEntity.name,
      ),
      'description': FormControl<String>(
        validators: [Validators.required],
        value: widget.craftsmanEntity.descriptionEN,
      ),
      'address': FormControl<String>(
        validators: [Validators.required],
        value: widget.craftsmanEntity.address,
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
