import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_toast.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/change_password/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordErrorState) {
            showToast(S.of(context).failedToChangePassword, ToastType.error);
          }
          if (state is ChangePasswordSuccessState) {
            showToast(
              S.of(context).passwordChangedMsg,
              ToastType.success,
            );

            Navigator.pop(context);
          }
        },
        child: const ChangePasswordBody(),
      ),
    );
  }
}
