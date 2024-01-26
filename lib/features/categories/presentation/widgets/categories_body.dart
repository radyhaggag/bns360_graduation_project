import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/data_state_widget.dart';
import '../bloc/categories_bloc.dart';
import 'category_card.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        final bloc = context.read<CategoriesBloc>();
        return DataStateWidget(
          isLoading: state is GetCategoriesLoadingState,
          isError: state is GetCategoriesErrorState,
          errorMessage: (state is GetCategoriesErrorState) ? state.message : "",
          isLoaded: state is GetCategoriesSuccessState,
          loadedWidget: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 30,
            ),
            itemBuilder: (context, index) {
              return CategoryCard(
                categoryEntity: bloc.categories[index],
              );
            },
          ),
        );
      },
    );
  }
}
