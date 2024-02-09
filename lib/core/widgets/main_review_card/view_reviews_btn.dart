part of 'main_review_card.dart';

class _ViewReviewsHintBtn extends StatelessWidget {
  const _ViewReviewsHintBtn();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "View reviews",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(.3),
                  fontSize: AppFontSize.light,
                ),
          ),
          const SizedBox(height: 10),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Theme.of(context).primaryColor.withOpacity(.3),
            size: 15.r,
          ),
        ],
      ),
    );
  }
}
