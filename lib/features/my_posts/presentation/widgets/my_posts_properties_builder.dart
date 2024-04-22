import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../core/widgets/property_card/property_card.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_posts_bloc.dart';
import 'more_section/more_icon.dart';

class MyPostsPropertiesBuilder extends StatelessWidget {
  const MyPostsPropertiesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPostsBloc, MyPostsState>(
      buildWhen: (previous, current) {
        final states = [
          GetMyPostsPropertiesLoadingState,
          GetMyPostsPropertiesErrorState,
          GetMyPostsPropertiesSuccessState,
          PostsUpdatedState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final myPostsProperties = context.read<MyPostsBloc>().myPostsProperties;

        return DataStateWidget(
          isLoading: state is GetMyPostsPropertiesLoadingState,
          isError: state is GetMyPostsPropertiesErrorState,
          isLoaded: state is GetMyPostsPropertiesSuccessState,
          errorMessage:
              state is GetMyPostsPropertiesErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<PropertyEntity>(
            list: myPostsProperties,
            emptyMessage: S.of(context).no_properties_found,
            itemWidget: (item, index) => PropertyCard(
              propertyEntity: item,
              moreWidget: MoreIcon(
                onDelete: () {
                  context.read<MyPostsBloc>().add(
                        DeletePostEvent(isJob: false, index: index),
                      );
                },
                onEdit: () {
                  Navigator.of(context).pushNamed(
                    Routes.addProperty,
                    arguments: item,
                  );
                },
              ),
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
