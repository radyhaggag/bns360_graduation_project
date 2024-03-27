part of 'job_card.dart';

class _JobPublisherSection extends StatelessWidget {
  const _JobPublisherSection({required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 15),
        InkWell(
          onTap: () {},
          child: JobPublisherImage(
            imageUrl: jobEntity.publisher.imageUrl!,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: _TitleAndSubTitleSection(
                  title: jobEntity.publisher.name,
                  subTitle: LocalizationHelper.getLocalizedString(
                    context,
                    ar: jobEntity.publisher.userDescriptionAR,
                    en: jobEntity.publisher.userDescriptionEN,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SaveJobBtn(isSaved: true),
      ],
    );
  }
}
