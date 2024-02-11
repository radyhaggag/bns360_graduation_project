import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainRatingBar extends StatelessWidget {
  const MainRatingBar({
    super.key,
    required this.starsCount,
    this.size,
  });

  final num starsCount;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
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
    );
  }
}
