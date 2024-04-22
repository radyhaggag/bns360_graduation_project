import 'package:bns360_graduation_project/core/helpers/common_dialogs.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/property_entity.dart';
import 'package:bns360_graduation_project/features/properties/presentation/bloc/properties_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/add_property/add_property_app_bar.dart';
import '../widgets/add_property/add_property_body.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key, this.propertyEntity});

  final PropertyEntity? propertyEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertiesBloc, PropertiesState>(
      listener: (context, state) {
        if (state is AddPropertyErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is AddPropertySuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).add_property_success,
          ).then((_) => Navigator.pop(context));
        }
      },
      child: Scaffold(
        appBar: AddPropertyScreenAppBar(
          isUpdate: propertyEntity != null,
        ),
        body: AddPropertyBody(
          propertyEntity: propertyEntity,
        ),
      ),
    );
  }
}
