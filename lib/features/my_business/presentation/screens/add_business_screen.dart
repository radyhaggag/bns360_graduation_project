import 'package:bns360_graduation_project/core/helpers/common_dialogs.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/category_item_entity.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/my_business_bloc.dart';
import '../widgets/add_business/add_business_body.dart';
import '../widgets/add_business/add_business_screen_app_bar.dart';

class AddBusinessScreen extends StatelessWidget {
  const AddBusinessScreen({super.key, this.categoryItemEntity});

  final CategoryItemEntity? categoryItemEntity;

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
          ).then((_) => Navigator.pop(context));
        }
      },
      child:  Scaffold(
        appBar: const AddBusinessScreenAppBar(),
        body: AddBusinessBody(categoryItemEntity: categoryItemEntity),
      ),
    );
  }
}
