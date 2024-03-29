part of 'property_card.dart';

class _PropertyPublisherSection extends StatelessWidget {
  const _PropertyPublisherSection({required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: PropertyPublisherImage(
            imageUrl: propertyEntity.publisher.imageUrl!,
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
                  title: propertyEntity.publisher.name,
                  subTitle: LocalizationHelper.getLocalizedString(
                    context,
                    ar: propertyEntity.publisher.userDescriptionAR ?? "",
                    en: propertyEntity.publisher.userDescriptionEN ?? "",
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
