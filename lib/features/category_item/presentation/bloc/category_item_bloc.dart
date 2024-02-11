import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/review_entity.dart';
import '../../domain/repositories/category_item_repo.dart';

part 'category_item_event.dart';
part 'category_item_state.dart';

class CategoryItemBloc extends Bloc<CategoryItemEvent, CategoryItemState> {
  final CategoryItemRepo categoryItemRepo;

  CategoryItemBloc({
    required this.categoryItemRepo,
  }) : super(CategoryItemInitial()) {
    on<GetCategoryItemReviewsEvent>(_getCategoryItemReviews);
  }

  List<ReviewEntity> reviews = [];

  _getCategoryItemReviews(
    GetCategoryItemReviewsEvent event,
    Emitter<CategoryItemState> emit,
  ) async {
    emit(GetCategoryItemReviewsLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await categoryItemRepo.getReviews(event.itemId);

    res.fold(
      (l) => emit(GetCategoryItemReviewsErrorState(message: l.message)),
      (r) {
        reviews = r;
        emit(GetCategoryItemReviewsSuccessState(reviews: r));
      },
    );
  }
}
