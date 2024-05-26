part of 'job_card.dart';

class _JobDateAndDetailsSection extends StatelessWidget {
  const _JobDateAndDetailsSection({
    required this.jobEntity,
    required this.isInSavedScreen,
  });

  final JobEntity jobEntity;
  final bool isInSavedScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          getDate(context),
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: AppFontSize.light,
            color: context.theme.primaryColor.withOpacity(.7),
          ),
        ),
        CustomElevatedButton(
          width: 100.w,
          label: S.of(context).details,
          height: 35.h,
          borderRadius: BorderRadius.circular(8),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(
              Routes.jobDetails,
              arguments: jobEntity,
            )
                .then((_) {
              if (isInSavedScreen) {
                NavigationService.navigatorKey.currentContext!
                    .read<SavedBloc>()
                    .add(
                      GetSavedJobsEvent(),
                    );
              }
            });
            // Navigator.of(context).pushNamed(
            //   Routes.editJob,
            //   arguments: jobEntity,
            // );
          },
        ),
      ],
    );
  }

  // todo: change the date here or remove it
  String getDate(BuildContext context) {
    return "${S.of(context).posted} ${DateFormatter.getSuitableDateString(
      context: context,
      date: jobEntity.timeAddedjob.toString(),
      showFullDateHours: false,
    )}";
  }
}
