import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../generated/l10n.dart';
import '../bloc/favorites_bloc.dart';

class FavoriteCraftsmenBuilder extends StatelessWidget {
  const FavoriteCraftsmenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) {
        final states = [
          GetFavoriteCraftsmenLoadingState,
          GetFavoriteCraftsmenErrorState,
          GetFavoriteCraftsmenSuccessState
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final favoriteCraftsmen =
            context.read<FavoritesBloc>().favoriteCraftsmen;

        return DataStateWidget(
          isLoading: state is GetFavoriteCraftsmenLoadingState,
          isError: state is GetFavoriteCraftsmenErrorState,
          isLoaded: state is GetFavoriteCraftsmenSuccessState,
          errorMessage:
              state is GetFavoriteCraftsmenErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<CraftsmanEntity>(
            list: favoriteCraftsmen,
            emptyMessage: S.of(context).no_favorite_items,
            itemWidget: (item, _) => HorizontalItemCard(
              title: item.name,
              subTitle: LocalizationHelper.getLocalizedString(
                context,
                ar: item.craft.nameAR,
                en: item.craft.nameEN,
              ),
              imageUrl: item.imageUrl,
              numOfRatings: item.numOfRatings,
              starsCount: item.averageRatings,
              isFavorite: true,
              onFavoriteIconPressed: () {},
              useSetStateToChangeFavoriteColor: true,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Routes.craftsman,
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
