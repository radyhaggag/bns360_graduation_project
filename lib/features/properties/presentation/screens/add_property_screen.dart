import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/common_dialogs.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/properties_bloc.dart';
import '../widgets/add_property/add_property_body.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

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
          // ).then((_) => Navigator.pop(context));
          ).then((_) => print('AddPropertySuccessState'));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: const AddPropertyBody(),
      ),
    );
  }
}
