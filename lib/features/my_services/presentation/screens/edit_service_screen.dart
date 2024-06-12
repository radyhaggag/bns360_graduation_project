import '../../../../core/helpers/common_dialogs.dart';
import '../bloc/my_services_bloc.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/edit_service/edit_service_body/edit_service_body.dart';

class EditServiceScreen extends StatelessWidget {
  const EditServiceScreen({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyServicesBloc, MyServicesState>(
      listener: (context, state) {
        if (state is UpdateServiceErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is UpdateServiceSuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).edit_service_success,
          ).then((_) => Navigator.pop(context));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor(context),
        body: EditServiceBody(
          craftsmanEntity: craftsmanEntity,
        ),
      ),
    );
  }
}
