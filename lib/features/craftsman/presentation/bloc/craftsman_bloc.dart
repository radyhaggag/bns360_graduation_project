import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/review_entity.dart';
import '../../domain/repositories/craftsman_repo.dart';

part 'craftsman_event.dart';
part 'craftsman_state.dart';

class CraftsmanBloc extends Bloc<CraftsmanEvent, CraftsmanState> {
  final CraftsmanRepo craftsmanRepo;

  CraftsmanBloc({
    required this.craftsmanRepo,
  }) : super(CraftsmanInitial()) {
    on<GetCraftsmanReviewsEvent>(_getCraftsmanReviews);
    on<RemoveCraftsmanReviewEvent>(_removeCraftsmanReview);
  }

  List<ReviewEntity> reviews = [];

  _getCraftsmanReviews(
    GetCraftsmanReviewsEvent event,
    Emitter<CraftsmanState> emit,
  ) async {
    emit(GetCraftsmanReviewsLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await craftsmanRepo.getReviews(event.itemId);

    res.fold(
      (l) => emit(GetCraftsmanReviewsErrorState(message: l.message)),
      (r) {
        reviews = r;
        emit(GetCraftsmanReviewsSuccessState(reviews: r));
      },
    );
  }

  _removeCraftsmanReview(
    RemoveCraftsmanReviewEvent event,
    Emitter<CraftsmanState> emit,
  ) async {
    emit(RemoveCraftsmanReviewLoadingState());

    final res = await craftsmanRepo.removeReview(event.itemId, event.reviewId);

    res.fold(
      (l) => emit(RemoveCraftsmanReviewErrorState(message: l.message)),
      (r) {
        reviews.removeWhere((element) => element.id == event.reviewId);
        emit(RemoveCraftsmanReviewSuccessState());
      },
    );
  }
}
