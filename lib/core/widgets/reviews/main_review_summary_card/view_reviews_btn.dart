part of 'main_review_summary_card.dart';

class _ViewReviewsHintBtn extends StatelessWidget {
  const _ViewReviewsHintBtn({
    this.onViewAllTap,
  });

  final void Function()? onViewAllTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onViewAllTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "View reviews",
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.theme.primaryColor.withOpacity(.3),
              fontSize: AppFontSize.light,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: context.theme.primaryColor.withOpacity(.3),
            size: 15.r,
          ),
        ],
      ),
    );
  }
}
