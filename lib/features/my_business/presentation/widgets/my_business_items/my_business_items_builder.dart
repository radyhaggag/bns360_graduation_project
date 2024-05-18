import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../core/widgets/more_icon.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/my_business_bloc.dart';

class MyBusinessItemsBuilder extends StatelessWidget {
  const MyBusinessItemsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: BlocBuilder<MyBusinessBloc, MyBusinessState>(
        buildWhen: (previous, current) {
          final states = [
            GetMyBusinessLoadingState,
            GetMyBusinessErrorState,
            GetMyBusinessSuccessState,
          ];
          return states.contains(current.runtimeType);
        },
        builder: (context, state) {
          final items = context.read<MyBusinessBloc>().myBusinessItems;

          return DataStateWidget(
            isLoading: state is GetMyBusinessLoadingState,
            isError: state is GetMyBusinessErrorState,
            isLoaded: state is GetMyBusinessSuccessState,
            errorMessage: state is GetMyBusinessErrorState ? state.message : "",
            loadedWidget: MainListViewBuilder<CategoryItemEntity>(
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
                // numOfRatings: item.numOfRatings,
                // starsCount: item.starsCount,
                numOfRatings: 59,
                starsCount: 4.6,
                isFavorite: true,
                onFavoriteIconPressed: () {},
                useSetStateToChangeFavoriteColor: true,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Routes.categoryItem,
                    arguments: item.copyWith(isBelongToMe: true),
                  );
                },
                moreWidget: MoreIcon(
                  onDelete: () {
                    context.read<MyBusinessBloc>().add(
                          DeleteMyBusinessEvent(businessId: item.id),
                        );
                  },
                  onEdit: () {
                    Navigator.of(context).pushNamed(
                      Routes.editBusiness,
                      arguments: item,
                    );
                  },
                  deleteMessage: S.of(context).delete_post,
                ),
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
