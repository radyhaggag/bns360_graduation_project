import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/widgets/custom_dropdown.dart';
import '../../../../generated/l10n.dart';
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
            SelectBusinessCategoryEvent(
                categoryId: (value as CategoryEntity).id),
          ),
          items: myBusinessBloc.businessCategories.map((e) => e).toList(),
          viewItems: myBusinessBloc.businessCategories
              .map(
                (e) => getTextValue(e),
              )
              .toList(),
          label: S.of(context).select_business_category,
          textValue: myBusinessBloc.selectedBusinessCategory != null
              ? getTextValue(myBusinessBloc.selectedBusinessCategory)
              : S.of(context).select_business_category,
          horizontalPadding: 0,
        );
      },
    );
  }

  String getTextValue(CategoryEntity? category) {
    return "${category?.categoryNameArabic} | ${category?.categoryNameEnglish}";
  }
}
