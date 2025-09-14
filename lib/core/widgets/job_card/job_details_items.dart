part of 'job_card.dart';

class _JobDescriptionItems extends StatelessWidget {
  const _JobDescriptionItems({required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _DetailsItem(
            value: jobEntity.type.getLocalizedString(context),
          ),
        ),
        Expanded(
          child: _DetailsItem(
            value: "${jobEntity.workHours} ${S.of(context).hr_work}",
          ),
        ),
        Expanded(
          child: _DetailsItem(
            value: jobEntity.salary.toPrice(context),
          ),
        ),
      ],
    );
  }
}

class _DetailsItem extends StatelessWidget {
  const _DetailsItem({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.backgroundColor(context),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 40.h,
      child: FittedBox(
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.primaryColor.withOpacity(.6),
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
