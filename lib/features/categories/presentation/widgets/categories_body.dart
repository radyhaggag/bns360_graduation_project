import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../bloc/categories_bloc.dart';
import 'category_card.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                final bloc = context.read<CategoriesBloc>();
                return DataStateWidget(
                  isLoading: state is GetCategoriesLoadingState,
                  isError: state is GetCategoriesErrorState,
                  errorMessage:
                      (state is GetCategoriesErrorState) ? state.message : "",
                  isLoaded: bloc.categories != null,
                  loadedWidget: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // todo: maybe need to reduce to be as cross spacing
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 160.h,
                    ),
                    itemCount:
                        (bloc.categories != null) ? bloc.categories!.length : 0,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        categoryEntity: bloc.categories![index],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
