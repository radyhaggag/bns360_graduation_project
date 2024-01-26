import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingsItemWithCount extends StatelessWidget {
  final num starsCount;
  final int numOfRatings;
  final double? size;
  const RatingsItemWithCount({
    super.key,
    required this.starsCount,
    required this.numOfRatings,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: starsCount.toDouble(),
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: size ?? 15.r,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (_) {},
            glow: false,
            ignoreGestures: true,
          ),
          const SizedBox(width: 5),
          Text(
            "($numOfRatings)",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
