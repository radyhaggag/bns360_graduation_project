import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/empty_card.dart';
import '../../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../core/widgets/more_icon.dart';
import '../../../../../generated/l10n.dart';
import '../../../../craftsman/domain/params/craftsman_screen_params.dart';
import '../../bloc/my_services_bloc.dart';

class MyServicesItemsBuilder extends StatelessWidget {
  const MyServicesItemsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: BlocBuilder<MyServicesBloc, MyServicesState>(
        builder: (context, state) {
          final items = context.read<MyServicesBloc>().myServicesItems;

          if (state is DeleteMyServiceLoadingState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: CenterProgressIndicator(
                color: context.theme.cardColor,
              ),
            );
          }

          return DataStateWidget(
            isLoading: state is GetMyServicesLoadingState,
            isError: state is GetMyServicesErrorState,
            isLoaded: state is GetMyServicesSuccessState,
            errorMessage: state is GetMyServicesErrorState ? state.message : "",
            loadedWidget: MainListViewBuilder<CraftsmanEntity>(
              list: items,
              emptyMessage: S.of(context).no_services_found,
              emptyWidget: SizedBox(
                width: context.width,
                height: context.height / 2,
                child: EmptyCard(
                  iconSize: 150.r,
                  title: S.of(context).no_services_found,
                ),
              ),
              itemWidget: (item, index) => HorizontalItemCard(
                isBusiness: false,
                itemId: item.id,
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
                  Navigator.of(context).pushNamed(
                    Routes.craftsman,
                    arguments: CraftsmanScreenParams(
                      itemId: item.id,
                      craftsmanEntity: item.copyWith(isBelongToMe: true),
                    ),
                  );
                },
                moreWidget: MoreIcon(
                  onDelete: () {
                    context.read<MyServicesBloc>().add(
                          DeleteMyServicesEvent(serviceId: item.id),
                        );
                  },
                  onEdit: () async {
                    await Navigator.of(context).pushNamed(
                      Routes.editService,
                      arguments: item,
                    );

                    if (context.mounted) {
                      context.read<MyServicesBloc>().add(GetMyServicesEvent());
                    }
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
