import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/common_dialogs.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_business_bloc.dart';
import '../widgets/edit_business/edit_business_body.dart';

class EditBusinessScreen extends StatelessWidget {
  const EditBusinessScreen({super.key, required this.categoryItemEntity});

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyBusinessBloc, MyBusinessState>(
      listener: (context, state) {
        if (state is GetBusinessTypesSuccessState) {
          context.read<MyBusinessBloc>().add(SelectBusinessCategoryEvent(
                categoryId: categoryItemEntity.categoriesModelId,
              ));
        }
        if (state is UpdateBusinessErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is UpdateBusinessSuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).add_business_success,
          ).then((_) => Navigator.pop(context));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          leading: const CustomBackButton(),
        ),
        body: EditBusinessBody(categoryItemEntity: categoryItemEntity),
      ),
    );
  }
}
