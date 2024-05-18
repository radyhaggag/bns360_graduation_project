import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../generated/l10n.dart';
import '../bloc/favorites_bloc.dart';

class FavoriteCategoriesBuilder extends StatelessWidget {
  const FavoriteCategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) {
        final states = [
          GetFavoriteCategoriesLoadingState,
          GetFavoriteCategoriesErrorState,
          GetFavoriteCategoriesSuccessState
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final favoriteCategories =
            context.read<FavoritesBloc>().favoriteCategories;

        return DataStateWidget(
          isLoading: state is GetFavoriteCategoriesLoadingState,
          isError: state is GetFavoriteCategoriesErrorState,
          isLoaded: state is GetFavoriteCategoriesSuccessState,
          errorMessage:
              state is GetFavoriteCategoriesErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<CategoryItemEntity>(
            list: favoriteCategories,
            emptyMessage: S.of(context).no_favorite_items,
            itemWidget: (item, _) => HorizontalItemCard(
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
              // numOfRatings: item.numOfRatings,
              // starsCount: item.starsCount,
              numOfRatings: 50,
              starsCount: 4.6,
              isFavorite: true,
              onFavoriteIconPressed: () {},
              useSetStateToChangeFavoriteColor: true,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Routes.categoryItem,
                  arguments: item,
                );
              },
            ),
            scrollDirection: Axis.vertical,
            width: context.width,
            height: context.height,
          ),
        );
      },
    );
  }
}
