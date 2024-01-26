import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/category_entity.dart';
import '../../domain/repositories/categories_repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesBloc({required this.categoriesRepo}) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>(_getCatteries);
  }

  List<CategoryEntity> categories = [];

  _getCatteries(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(GetCategoriesLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await categoriesRepo.getCategories();

    res.fold(
      (l) => emit(GetCategoriesErrorState(message: l.message)),
      (r) {
        categories = r;
        emit(GetCategoriesSuccessState(categories: r));
      },
    );
  }
}
