import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/common_dialogs.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_business_bloc.dart';
import '../widgets/add_business/add_business_body.dart';

class AddBusinessScreen extends StatelessWidget {
  const AddBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBusinessBloc, MyBusinessState>(
      listener: (context, state) {
        if (state is AddBusinessErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is AddBusinessSuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).add_business_success,
          ).then((_) {
            if (context.mounted) Navigator.pop(context);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          leading: const CustomBackButton(),
        ),
        body: const AddBusinessBody(),
      ),
    );
  }
}
