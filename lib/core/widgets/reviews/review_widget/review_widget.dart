import 'package:bns360_graduation_project/core/widgets/remove_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/date_formatter.dart';
import '../../../shared_data/entities/review_entity.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/constants.dart';
import '../../../utils/extensions/context.dart';
import '../../main_network_image.dart';
import '../../main_rating_bar.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.review,
    required this.onRemove,
  });

  final ReviewEntity review;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
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
                          style: context.textTheme.titleMedium?.copyWith(
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
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: AppFontSize.light,
                    color: context.theme.hintColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  review.reviewText,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: AppFontSize.light,
                  ),
                ),
              ),
              if (review.isByMe) ...[
                const SizedBox(width: 15),
                DeleteIcon(
                  onTap: onRemove,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
