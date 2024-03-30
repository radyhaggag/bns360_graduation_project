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
        InkWell(
          onTap: () {},
          child: _TitleAndDateSection(
            title: propertyEntity.publisher.name,
            date: propertyEntity.date,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: PropertyPriceItem(
            offerType: propertyEntity.offerType,
            price: propertyEntity.price,
          ),
        ),
      ],
    );
  }
}

class PropertyPublisherImage extends StatelessWidget {
  final String imageUrl;
  const PropertyPublisherImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: MainNetworkImage(
        imageUrl: imageUrl,
        width: 45.r,
        height: 45.r,
        fit: BoxFit.cover,
      ),
    );
  }
}
