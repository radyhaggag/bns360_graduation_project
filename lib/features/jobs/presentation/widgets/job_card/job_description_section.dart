part of 'job_card.dart';

class _JobDescriptionSection extends StatelessWidget {
  const _JobDescriptionSection({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).description,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: AppFontSize.details,
            color: context.theme.cardColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: AppFontSize.details,
            color: context.theme.primaryColor.withOpacity(.6),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
