import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../core/widgets/property_card/property_card.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/properties_bloc.dart';

class PropertiesBuilder extends StatelessWidget {
  const PropertiesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesBloc, PropertiesState>(
      buildWhen: (previous, current) {
        final states = [
          GetPropertiesLoadingState,
          GetPropertiesErrorState,
          GetPropertiesSuccessState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final propertiesBloc = context.read<PropertiesBloc>();

        return DataStateWidget(
          isLoading: state is GetPropertiesLoadingState,
          isError: state is GetPropertiesErrorState,
          isLoaded: state is GetPropertiesSuccessState,
          errorMessage: state is GetPropertiesErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<PropertyEntity>(
            list: propertiesBloc.items,
            emptyMessage: S.of(context).no_properties_found,
            itemWidget: (item, _) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.editProperty,
                  arguments: item,
                );
              },
              child: PropertyCard(propertyEntity: item),
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
