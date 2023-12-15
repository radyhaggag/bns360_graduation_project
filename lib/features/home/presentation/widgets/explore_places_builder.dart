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
          loadedWidget: MainListViewBuilder<CategoryDetailsEntity>(
            list: placesToExplore,
            emptyMessage: S.of(context).no_places_to_explore,
            itemWidget: (item) => CategoryDetailsCard(
              categoryDetailsEntity: item,
            ),
            scrollDirection: Axis.horizontal,
            width: double.infinity,
            height: 300.h,
          ),
        );
      },
    );
  }
}
