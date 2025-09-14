import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/common_dialogs.dart';
import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/properties_bloc.dart';
import '../widgets/edit_property/edit_property_body.dart';

class EditPropertyScreen extends StatelessWidget {
  const EditPropertyScreen({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertiesBloc, PropertiesState>(
      listener: (context, state) {
        if (state is EditPropertyErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is EditPropertySuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).edit_property_success,
          ).then((_) {
            if (context.mounted) Navigator.pop(context);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: EditPropertyBody(
          propertyEntity: propertyEntity,
        ),
      ),
    );
  }
}
