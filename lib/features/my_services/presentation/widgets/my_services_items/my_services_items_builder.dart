import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/horizontal_item/horizontal_item_card.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../core/widgets/more_icon.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/my_services_bloc.dart';

class MyServicesItemsBuilder extends StatelessWidget {
  const MyServicesItemsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: BlocBuilder<MyServicesBloc, MyServicesState>(
        buildWhen: (previous, current) {
          final states = [
            GetMyServicesLoadingState,
            GetMyServicesErrorState,
            GetMyServicesSuccessState,
          ];
          return states.contains(current.runtimeType);
        },
        builder: (context, state) {
          final items = context.read<MyServicesBloc>().myServicesItems;

          return DataStateWidget(
            isLoading: state is GetMyServicesLoadingState,
            isError: state is GetMyServicesErrorState,
            isLoaded: state is GetMyServicesSuccessState,
            errorMessage: state is GetMyServicesErrorState ? state.message : "",
            loadedWidget: MainListViewBuilder<CraftsmanEntity>(
              list: items,
              emptyMessage: S.of(context).no_places_to_explore,
              itemWidget: (item, index) => HorizontalItemCard(
                title: item.name,
                subTitle: LocalizationHelper.getLocalizedString(
                  context,
                  ar: item.craft.nameAR,
                  en: item.craft.nameEN,
                ),
                imageUrl: item.imageUrl,
                numOfRatings: item.numOfRatings,
                starsCount: item.numOfRatings,
                isFavorite: true,
                onFavoriteIconPressed: () {},
                useSetStateToChangeFavoriteColor: true,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Routes.craftsman,
                    arguments: item.copyWith(isBelongToMe: true),
                  );
                },
                moreWidget: MoreIcon(
                  onDelete: () {
                    context.read<MyServicesBloc>().add(
                          DeleteMyServicesEvent(serviceId: item.id),
                        );
                  },
                  onEdit: () {
                    Navigator.of(context).pushNamed(
                      Routes.editService,
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
