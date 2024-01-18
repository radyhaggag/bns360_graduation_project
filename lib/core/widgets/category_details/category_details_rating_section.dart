part of 'category_details_card.dart';

class _CategoryDetailsRatingSection extends StatelessWidget {
  final num starsCount;
  final int numOfRatings;
  const _CategoryDetailsRatingSection({
    required this.starsCount,
    required this.numOfRatings,
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
            itemSize: 19.r,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (_) {},
            glow: false,
            ignoreGestures: true,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              "($numOfRatings)",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
