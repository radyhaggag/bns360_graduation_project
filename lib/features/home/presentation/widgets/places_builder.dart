import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home_bloc.dart';
import 'category_details_card.dart';

class PlacesBuilder extends StatelessWidget {
  const PlacesBuilder({super.key});

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
        if (state is GetPlacesToExploreSuccessState) {
          return SizedBox(
            height: 300.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryDetailsCard(
                  categoryDetailsEntity: state.placesToExplore[index],
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemCount: state.placesToExplore.length,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
