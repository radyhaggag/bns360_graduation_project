import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../core/widgets/property_card/property_card.dart';
import '../../../../generated/l10n.dart';
import '../bloc/saved_bloc.dart';

class SavedPropertiesBuilder extends StatelessWidget {
  const SavedPropertiesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      builder: (context, state) {
        final savedProperties = context.read<SavedBloc>().savedProperties;

        return DataStateWidget(
          isLoading: state is GetSavedPropertiesLoadingState,
          isError: state is GetSavedPropertiesErrorState,
          isLoaded: state is GetSavedPropertiesSuccessState,
          errorMessage:
              state is GetSavedPropertiesErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<PropertyEntity>(
            list: savedProperties,
            emptyMessage: S.of(context).no_properties_found,
            itemWidget: (item, _) => PropertyCard(
              propertyEntity: item,
              isInSavedScreen: true,
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
