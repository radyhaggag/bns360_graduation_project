import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/empty_card.dart';
import '../../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../core/widgets/more_icon.dart';
import '../../../../../generated/l10n.dart';
import '../../../../category_item/domain/params/category_item_screen_params.dart';
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
              emptyMessage: S.of(context).no_business_found,
              emptyWidget: SizedBox(
                width: context.width,
                height: context.height / 2,
                child: EmptyCard(
                  iconSize: 150.r,
                  title: S.of(context).no_business_found,
                ),
              ),
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
                  numOfRatings: item.reviewSummary?.totalReviews ?? 0,
                  starsCount: item.reviewSummary?.averageRating ?? 0,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Routes.categoryItem,
                      arguments: CategoryItemScreenParams(
                        itemId: item.id,
                        categoryItemEntity: item.copyWith(isBelongToMe: true),
                        isBelongToMe: true,
                      ),
                    );
                  },
                  moreWidget: MoreIcon(
                    onDelete: () {
                      context.read<MyBusinessBloc>().add(
                            DeleteMyBusinessEvent(businessId: item.id),
                          );
                    },
                    onEdit: () async {
                      await Navigator.of(context).pushNamed(
                        Routes.editBusiness,
                        arguments: item,
                      );
                      if (context.mounted) {
                        context
                            .read<MyBusinessBloc>()
                            .add(GetMyBusinessEvent());
                      }
                    },
                    deleteMessage: S.of(context).delete_post,
                  ),
                  isBusiness: true,
                  itemId: item.id),
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
