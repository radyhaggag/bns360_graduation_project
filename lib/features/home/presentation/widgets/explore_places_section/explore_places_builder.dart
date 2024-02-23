part of 'explore_places_section.dart';

class _ExplorePlacesBuilder extends StatelessWidget {
  const _ExplorePlacesBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        final states = [
          GetPlacesToExploreLoadingState,
          GetPlacesToExploreErrorState,
          GetPlacesToExploreSuccessState
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final placesToExplore = context.read<HomeBloc>().placesToExplore;

        return DataStateWidget(
          isLoading: state is GetPlacesToExploreLoadingState,
          isError: state is GetPlacesToExploreErrorState,
          isLoaded: state is GetPlacesToExploreSuccessState,
          errorMessage:
              state is GetPlacesToExploreErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<CategoryItemEntity>(
            list: placesToExplore,
            emptyMessage: S.of(context).no_places_to_explore,
            itemWidget: (item, _) => CategoryItemCard(
              categoryItemEntity: item,
              onFavoriteIconPressed: () {},
              useSetStateToChangeFavoriteColor: true,
            ),
            scrollDirection: Axis.horizontal,
            width: context.width,
            height: 275.h,
          ),
        );
      },
    );
  }
}
