import 'package:bns360_graduation_project/core/widgets/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../generated/l10n.dart';
import '../../../craftsman/domain/params/craftsman_screen_params.dart';
import '../bloc/favorites_bloc.dart';

class FavoriteCraftsmenBuilder extends StatelessWidget {
  const FavoriteCraftsmenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
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
            emptyWidget: Center(
              child: EmptyCard(
                title: S.of(context).no_favorite_items,
              ),
            ),
            itemWidget: (item, _) => HorizontalItemCard(
              title: LocalizationHelper.getLocalizedString(
                context,
                ar: item.nameAR,
                en: item.nameEN,
              ),
              subTitle: LocalizationHelper.getLocalizedString(
                context,
                ar: item.craft.nameAR,
                en: item.craft.nameEN,
              ),
              imageUrl: item.profileImageUrl,
              numOfRatings: item.reviewSummary!.totalReviews,
              starsCount: item.reviewSummary!.averageRating,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(
                  Routes.craftsman,
                  arguments: CraftsmanScreenParams(
                    itemId: item.id,
                    craftsmanEntity: item,
                  ),
                )
                    .then((_) {
                  if (context.mounted) {
                    context.read<FavoritesBloc>().add(GetFavoriteCraftsmenEvent(
                          skipPreviousCheck: false,
                        ));
                  }
                });
              },
              isBusiness: false,
              itemId: item.id,
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
