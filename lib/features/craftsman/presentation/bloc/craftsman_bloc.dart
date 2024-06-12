import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/shared_data/entities/review_entity.dart';
import '../../../../core/shared_data/entities/review_summary_entity.dart';
import '../../domain/repositories/craftsman_repo.dart';

part 'craftsman_event.dart';
part 'craftsman_state.dart';

class CraftsmanBloc extends Bloc<CraftsmanEvent, CraftsmanState> {
  final CraftsmanRepo craftsmanRepo;

  CraftsmanBloc({
    required this.craftsmanRepo,
  }) : super(CraftsmanInitial()) {
    on<GetCraftsmanReviewSummaryEvent>(_getCraftsmanReviewSummary);
    on<GetCraftsmanReviewsEvent>(_getCraftsmanReviews);
    on<GetCraftsmanEvent>(_getCraftsman);
    on<SetCraftsmanEntityEvent>(_setCraftsmanEntity);
    on<SendCraftsmanReviewEvent>(_sendReview);
    on<RemoveCraftsmanReviewEvent>(_removeCraftsmanReview);
  }

  List<ReviewEntity> reviews = [];

  _getCraftsmanReviews(
    GetCraftsmanReviewsEvent event,
    Emitter<CraftsmanState> emit,
  ) async {
    emit(GetCraftsmanReviewsLoadingState());

    final res = await craftsmanRepo.getReviews(event.itemId);

    res.fold(
      (l) => emit(GetCraftsmanReviewsErrorState(message: l.message)),
      (r) {
        reviews = r;
        emit(GetCraftsmanReviewsSuccessState(reviews: r));
      },
    );
  }

  ReviewSummaryEntity? reviewsSummary;

  _getCraftsmanReviewSummary(
    GetCraftsmanReviewSummaryEvent event,
    Emitter<CraftsmanState> emit,
  ) async {
    emit(GetCraftsmanReviewSummaryLoadingState());

    final res = await craftsmanRepo.getCraftsmanReviewSummary(event.itemId);

    res.fold(
      (l) => emit(GetCraftsmanReviewSummaryErrorState(message: l.message)),
      (r) {
        reviewsSummary = r;
        emit(GetCraftsmanReviewSummarySuccessState(summary: r));
      },
    );
  }

  CraftsmanEntity? craftsman;

  _getCraftsman(
    GetCraftsmanEvent event,
    Emitter<CraftsmanState> emit,
  ) async {
    emit(GetCraftsmanLoadingState());

    final res = await craftsmanRepo.getCraftsman(event.itemId);

    res.fold(
      (l) => emit(GetCraftsmanErrorState(message: l.message)),
      (r) {
        craftsman = r;
        emit(GetCraftsmanSuccessState(craftsmanEntity: r));
      },
    );
  }

  _setCraftsmanEntity(
    SetCraftsmanEntityEvent event,
    Emitter<CraftsmanState> emit,
  ) {
    craftsman = event.craftsmanEntity;
    emit(GetCraftsmanSuccessState(craftsmanEntity: craftsman!));
  }

  FutureOr<void> _sendReview(
    SendCraftsmanReviewEvent event,
    Emitter<CraftsmanState> emit,
  ) async {
    emit(SendCraftsmanReviewLoadingState());

    final res = await craftsmanRepo.sendReview(
      event.itemId,
      event.rating,
      event.review,
    );

    res.fold(
      (l) => emit(SendCraftsmanReviewErrorState(
        message: l.message,
        rating: event.rating,
        review: event.review,
      )),
      (r) {
        if (event.loadReviews) {
          add(GetCraftsmanReviewsEvent(itemId: event.itemId));
        } else {
          add(GetCraftsmanReviewSummaryEvent(itemId: event.itemId));
        }
        emit(SendCraftsmanReviewSuccessState());
      },
    );
  }

  _removeCraftsmanReview(
    RemoveCraftsmanReviewEvent event,
    Emitter<CraftsmanState> emit,
  ) async {
    emit(RemoveCraftsmanReviewLoadingState(
      reviewId: event.reviewId,
    ));

    final res = await craftsmanRepo.removeReview(
      event.reviewId,
      event.craftsmanId,
    );

    res.fold(
      (l) => emit(RemoveCraftsmanReviewErrorState(message: l.message)),
      (r) {
        reviews.removeWhere((element) => element.id == event.reviewId);
        emit(RemoveCraftsmanReviewSuccessState());
      },
    );
  }
}
