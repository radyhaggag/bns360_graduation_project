import '../../../../../core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/category_entity.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/icons/main_search_icon.dart';
import '../../../../../core/widgets/input_fields/search_field.dart';
import '../../bloc/categories_bloc.dart';

class CategoryItemsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryItemsScreenAppBar({
    super.key,
    required this.categoryEntity,
  });

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) {
        return current is SearchIconToggled;
      },
      builder: (context, state) {
        final bloc = context.read<CategoriesBloc>();
        return Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: context.theme.appBarTheme.backgroundColor,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 60,
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: AnimatedCrossFade(
                  firstChild: Row(
                    children: [
                      InkWell(
                        onTap: () => bloc.add(ToggleSearchIcon(
                          categoryId: categoryEntity.id,
                        )),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: SearchField(
                          searchController: bloc.searchController,
                          onFieldSubmitted: () {
                            bloc.add(SearchOnCategoryItems(
                              categoryId: categoryEntity.id,
                            ));
                          },
                          hintText: getItemTxt(context),
                        ),
                      ),
                    ],
                  ),
                  secondChild: Row(
                    children: [
                      const CustomBackButton(),
                      Text(
                        getItemTxt(context),
                        style:
                            context.theme.appBarTheme.titleTextStyle?.copyWith(
                          fontSize: AppFontSize.subTitle,
                        ),
                      ),
                    ],
                  ),
                  crossFadeState: bloc.isSearchEnabled
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 150),
                ),
              ),
              MainSearchIcon(
                horizontalPadding: 0.0,
                onTap: () {
                  if (!bloc.isSearchEnabled) {
                    bloc.add(ToggleSearchIcon(
                      categoryId: categoryEntity.id,
                    ));
                  } else {
                    bloc.add(SearchOnCategoryItems(
                      categoryId: categoryEntity.id,
                    ));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  String getItemTxt(BuildContext context) {
    return LocalizationHelper.getLocalizedString(
      context,
      ar: categoryEntity.categoryNameArabic,
      en: categoryEntity.categoryNameEnglish,
    );
  }
}
