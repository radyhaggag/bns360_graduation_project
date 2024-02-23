import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/media_query.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../generated/l10n.dart';
import '../bloc/crafts_bloc.dart';

class CraftsmenBuilder extends StatelessWidget {
  const CraftsmenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CraftsBloc, CraftsState>(
      buildWhen: (previous, current) {
        final states = [
          GetCraftsmenLoadingState,
          GetCraftsmenErrorState,
          GetCraftsmenSuccessState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final favoriteCraftsmen = context.read<CraftsBloc>().craftsmen;

        return DataStateWidget(
          isLoading: state is GetCraftsmenLoadingState,
          isError: state is GetCraftsmenErrorState,
          isLoaded: state is GetCraftsmenSuccessState,
          errorMessage: state is GetCraftsmenErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<CraftsmanEntity>(
            list: favoriteCraftsmen,
            emptyMessage: S.of(context).no_craftsmen_found,
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
