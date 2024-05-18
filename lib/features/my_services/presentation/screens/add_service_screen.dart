import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/common_dialogs.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_services_bloc.dart';
import '../widgets/add_service/add_service_body.dart';
import '../widgets/add_service/add_service_screen_app_bar.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyServicesBloc, MyServicesState>(
      listener: (context, state) {
        if (state is AddServiceErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is AddServiceSuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).add_service_success,
          ).then((_) => Navigator.pop(context));
        }
      },
      child: const Scaffold(
        appBar: AddServiceScreenAppBar(),
        body: AddServiceBody(),
      ),
    );
  }
}
