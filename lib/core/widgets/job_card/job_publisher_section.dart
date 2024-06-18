part of 'job_card.dart';

class _JobPublisherSection extends StatelessWidget {
  const _JobPublisherSection({required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JobPublisherImage(
          imageUrl: jobEntity.publisherDetails.photoUrl,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleAndSubTitleSection(
                title: jobEntity.publisherDetails.name,
                subTitle: jobEntity.publisherDetails.getDescription(context),
              ),
            ],
          ),
        ),
        SaveIcon(
          itemId: jobEntity.id,
          isJob: true,
        ),
      ],
    );
  }
}
