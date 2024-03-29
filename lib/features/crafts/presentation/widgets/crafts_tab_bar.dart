import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../bloc/crafts_bloc.dart';
import 'craft_item.dart';

class CraftsTabBar extends StatelessWidget {
  const CraftsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: LocalizationHelper.currentLanguage == Language.arabic ? 0 : 12,
        right: LocalizationHelper.currentLanguage == Language.arabic ? 12 : 0,
      ),
      child: BlocBuilder<CraftsBloc, CraftsState>(
        buildWhen: (previous, current) {
          final states = [
            GetCraftsLoadingState,
            GetCraftsErrorState,
            GetCraftsSuccessState,
            GetCraftsmenLoadingState,
            GetCraftsmenErrorState,
            GetCraftsmenSuccessState,
          ];
          return states.contains(current.runtimeType);
        },
        builder: (context, state) {
          final bloc = context.read<CraftsBloc>();
          final crafts = bloc.crafts;
          final selectedCraftId = bloc.selectedCraftId;

          return DataStateWidget(
            isLoading: crafts == null,
            isError: state is GetCraftsErrorState,
            isLoaded: state is GetCraftsSuccessState,
            errorMessage: state is GetCraftsErrorState ? state.message : "",
            loadingWidget: const _LoadingWidget(),
            loadedWidget: _LoadedWidget(
              crafts: crafts ?? [],
              selectedCraftId: selectedCraftId,
            ),
          );
        },
      ),
    );
  }
}

class _LoadedWidget extends StatelessWidget {
  const _LoadedWidget({
    required this.crafts,
    required this.selectedCraftId,
  });

  final List<CraftEntity> crafts;
  final int selectedCraftId;

  @override
  Widget build(BuildContext context) {
    return MainListViewBuilder<CraftEntity>(
      list: crafts,
      emptyMessage: "",
      itemWidget: (item, _) => CraftItem(
        craftEntity: item,
        isSelected: item.id == selectedCraftId,
      ),
      scrollDirection: Axis.horizontal,
      width: context.width,
      height: 35.h,
      separatingSpace: 12,
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return MainListViewBuilder<Null>(
      list: List.filled(8, null),
      itemWidget: (_, __) => CraftItem.empty(context),
      scrollDirection: Axis.horizontal,
      width: context.width,
      height: 35.h,
      separatingSpace: 12,
    );
  }
}
