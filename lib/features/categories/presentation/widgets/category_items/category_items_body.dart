import 'package:bns360_graduation_project/core/shared_data/entities/category_item_info_entity.dart';
import 'package:bns360_graduation_project/features/category_item/domain/params.dart/category_item_screen_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/categories_bloc.dart';

class CategoryItemsBody extends StatelessWidget {
  const CategoryItemsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        buildWhen: (previous, current) {
          final states = [
            GetCategoryItemsLoadingState,
            GetCategoryItemsErrorState,
            GetCategoryItemsSuccessState,
          ];
          return states.contains(current.runtimeType);
        },
        builder: (context, state) {
          final items = context.read<CategoriesBloc>().items;

          return DataStateWidget(
            isLoading: state is GetCategoryItemsLoadingState,
            isError: state is GetCategoryItemsErrorState,
            isLoaded: state is GetCategoryItemsSuccessState,
            errorMessage:
                state is GetCategoryItemsErrorState ? state.message : "",
            loadedWidget: MainListViewBuilder<CategoryItemInfoEntity>(
              list: items,
              emptyMessage: S.of(context).no_places_to_explore,
              itemWidget: (item, index) => HorizontalItemCard(
                title: LocalizationHelper.getLocalizedString(
                  context,
                  ar: item.businessNameArabic,
                  en: item.businessNameEnglish,
                ),
                subTitle: LocalizationHelper.getLocalizedString(
                  context,
                  ar: item.categoriesModel.categoryNameArabic,
                  en: item.categoriesModel.categoryNameEnglish,
                ),
                imageUrl: item.profileImageName,
                numOfRatings: item.totalReviews.toInt(),
                starsCount: item.averageRating,
                isFavorite: true,
                onFavoriteIconPressed: () {},
                useSetStateToChangeFavoriteColor: true,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Routes.categoryItem,
                    arguments: CategoryItemScreenParams(
                      itemId: item.id,
                      categoryItemInfoEntity: item,
                    )
                  );
                },
              ),
              scrollDirection: Axis.vertical,
              width: context.width,
              height: context.height,
            ),
          );
        },
      ),
    );
  }
}
