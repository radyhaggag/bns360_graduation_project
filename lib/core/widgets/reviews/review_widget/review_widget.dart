import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/date_formatter.dart';
import '../../../shared_data/entities/review_entity.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/constants.dart';
import '../../main_network_image.dart';
import '../../main_rating_bar.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.review});

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: MainNetworkImage(
                  imageUrl: review.userImage,
                  width: 38.r,
                  height: 38.r,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          review.userName,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: AppFontSize.light,
                                  ),
                        ),
                      ),
                      MainRatingBar(
                        starsCount: review.starCount,
                        size: 12.r,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  DateFormatter.getSuitableDateString(
                    context: context,
                    date: review.date,
                    showFullDateHours: true,
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: AppFontSize.light,
                        color: Theme.of(context).hintColor,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            review.reviewText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: AppFontSize.light,
                ),
          ),
        ],
      ),
    );
  }
}
