import 'package:bns360_graduation_project/core/widgets/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_info_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../generated/l10n.dart';
import '../../../craftsman/domain/params/craftsman_screen_params.dart';
import '../bloc/crafts_bloc.dart';

class CraftsmenBuilder extends StatelessWidget {
  const CraftsmenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CraftsBloc, CraftsState>(
      builder: (context, state) {
        final items = context.read<CraftsBloc>().items;

        return DataStateWidget(
          isLoading: state is GetCraftItemsByIdLoadingState,
          isError: state is GetCraftItemsByIdErrorState,
          isLoaded: state is GetCraftItemsByIdSuccessState,
          errorMessage:
              state is GetCraftItemsByIdErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<CraftsmanInfoEntity>(
            list: items,
            emptyMessage: S.of(context).no_craftsmen_found,
            emptyWidget: Center(
              child: EmptyCard(
                title: S.of(context).no_craftsmen_found,
              ),
            ),
            itemWidget: (item, _) => HorizontalItemCard(
              isBusiness: false,
              itemId: item.id,
              title: LocalizationHelper.getLocalizedString(
                context,
                ar: item.craftsmanNameArabic,
                en: item.craftsmanNameEnglish,
              ),
              subTitle: LocalizationHelper.getLocalizedString(
                context,
                ar: item.craft.nameAR,
                en: item.craft.nameEN,
              ),
              imageUrl: item.profileImageName,
              numOfRatings: item.totalReviews.toInt(),
              starsCount: item.averageRating,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Routes.craftsman,
                  arguments: CraftsmanScreenParams(
                    itemId: item.id,
                    craftsmanInfoEntity: item,
                  ),
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
