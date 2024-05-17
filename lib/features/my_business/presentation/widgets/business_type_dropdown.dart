import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/category_entity.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_dropdown.dart';
import '../bloc/my_business_bloc.dart';

class BusinessTypeDropdown extends StatelessWidget {
  const BusinessTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBusinessBloc, MyBusinessState>(
      builder: (context, state) {
        final myBusinessBloc = context.read<MyBusinessBloc>();
        return CustomDropdown<CategoryEntity>(
          value: myBusinessBloc.selectedBusinessCategory,
          onTapCallback: (value) => myBusinessBloc.add(
            SelectBusinessCategoryEvent(categoryId: value),
          ),
          items: myBusinessBloc.businessCategories.map((e) => e).toList(),
          viewItems: myBusinessBloc.businessCategories
              .map(
                (e) => LocalizationHelper.getLocalizedString(
                  context,
                  ar: e.categoryNameArabic,
                  en: e.categoryNameEnglish,
                ),
              )
              .toList(),
          label: S.of(context).select_business_category,
          textValue: myBusinessBloc.selectedBusinessCategory != null
              ? LocalizationHelper.getLocalizedString(
                  context,
                  ar: myBusinessBloc.selectedBusinessCategory?.categoryNameArabic ?? "",
                  en: myBusinessBloc.selectedBusinessCategory?.categoryNameEnglish ?? "",
                )
              : S.of(context).select_business_category,
          horizontalPadding: 0,
        );
      },
    );
  }
}
