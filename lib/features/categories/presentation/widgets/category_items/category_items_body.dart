import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/category_item_entity.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 5),
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
            loadedWidget: MainListViewBuilder<CategoryItemEntity>(
              list: items,
              emptyMessage: S.of(context).no_places_to_explore,
              itemWidget: (item, index) => HorizontalItemCard(
                title: LocalizationHelper.getLocalizedString(
                  context,
                  ar: item.nameAR,
                  en: item.nameEN,
                ),
                subTitle: LocalizationHelper.getLocalizedString(
                  context,
                  ar: item.category.nameAR,
                  en: item.category.nameEN,
                ),
                imageUrl: item.imageUrl,
                numOfRatings: item.numOfRatings,
                starsCount: item.starsCount,
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
      ),
    );
  }
}
