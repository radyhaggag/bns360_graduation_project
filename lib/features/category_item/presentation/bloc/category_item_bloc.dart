import 'dart:async';

import 'package:bns360_graduation_project/core/shared_data/entities/category_item_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/review_summary_entity.dart';
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
    on<GetCategoryItemReviewSummaryEvent>(_getCategoryItemReviewSummary);
    on<GetCategoryItemReviewsEvent>(_getCategoryItemReviews);
    on<GetCategoryItemEvent>(_getCategoryItem);
    on<SetCategoryItemEntityEvent>(_setCategoryItemEntity);
    on<SendReviewEvent>(_sendReview);
    on<RemoveCategoryItemReviewEvent>(_removeCategoryItemReview);
  }

  List<ReviewEntity> reviews = [];

  _getCategoryItemReviews(
    GetCategoryItemReviewsEvent event,
    Emitter<CategoryItemState> emit,
  ) async {
    emit(GetCategoryItemReviewsLoadingState());

    final res = await categoryItemRepo.getReviews(event.itemId);

    res.fold(
      (l) => emit(GetCategoryItemReviewsErrorState(message: l.message)),
      (r) {
        reviews = r;
        emit(GetCategoryItemReviewsSuccessState(reviews: r));
      },
    );
  }

  ReviewSummaryEntity? reviewsSummary;

  _getCategoryItemReviewSummary(
    GetCategoryItemReviewSummaryEvent event,
    Emitter<CategoryItemState> emit,
  ) async {
    emit(GetCategoryItemReviewSummaryLoadingState());

    final res =
        await categoryItemRepo.getCategoryItemReviewSummary(event.itemId);

    res.fold(
      (l) => emit(GetCategoryItemReviewSummaryErrorState(message: l.message)),
      (r) {
        reviewsSummary = r;
        emit(GetCategoryItemReviewSummarySuccessState(summary: r));
      },
    );
  }

  CategoryItemEntity? categoryItem;

  _getCategoryItem(
    GetCategoryItemEvent event,
    Emitter<CategoryItemState> emit,
  ) async {
    emit(GetCategoryItemLoadingState());

    final res = await categoryItemRepo.getCategoryItem(event.itemId);

    res.fold(
      (l) => emit(GetCategoryItemErrorState(message: l.message)),
      (r) {
        categoryItem = r;
        emit(GetCategoryItemSuccessState(categoryItem: r));
      },
    );
  }

  _setCategoryItemEntity(
    SetCategoryItemEntityEvent event,
    Emitter<CategoryItemState> emit,
  ) {
    categoryItem = event.categoryItemEntity;
    emit(GetCategoryItemSuccessState(categoryItem: categoryItem!));
  }

  FutureOr<void> _sendReview(
    SendReviewEvent event,
    Emitter<CategoryItemState> emit,
  ) async {
    emit(SendCategoryItemReviewLoadingState());

    final res = await categoryItemRepo.sendReview(
      event.itemId,
      event.rating,
      event.review,
    );

    res.fold(
      (l) => emit(SendCategoryItemReviewErrorState(
        message: l.message,
        rating: event.rating,
        review: event.review,
      )),
      (r) {
        add(GetCategoryItemReviewsEvent(itemId: event.itemId));
        emit(SendCategoryItemReviewSuccessState());
      },
    );
  }

  _removeCategoryItemReview(
    RemoveCategoryItemReviewEvent event,
    Emitter<CategoryItemState> emit,
  ) async {
    emit(RemoveCategoryItemReviewLoadingState(reviewId: event.reviewId));

    final res = await categoryItemRepo.removeReview(
      event.reviewId,
      event.categoryItemId,
    );

    res.fold(
      (l) => emit(RemoveCategoryItemReviewErrorState(message: l.message)),
      (r) {
        reviews.removeWhere((element) => element.id == event.reviewId);
        emit(RemoveCategoryItemReviewSuccessState());
      },
    );
  }
}
