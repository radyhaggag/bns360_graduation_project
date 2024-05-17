import 'package:bns360_graduation_project/core/helpers/date_formatter.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/property_entity.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/main_network_image.dart';
import 'property_price_item.dart';

class PropertyPublisherSection extends StatelessWidget {
  const PropertyPublisherSection({
    super.key,
    required this.propertyEntity,
    this.isMiniMode = true,
  });

  final PropertyEntity propertyEntity;
  final bool isMiniMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          isMiniMode ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: PropertyPublisherImage(
            imageUrl: propertyEntity.publisher.photoUrl,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {},
          child: _PublisherNameAndHintSection(
            title: propertyEntity.publisher.name,
            date: propertyEntity.timeAddedProperty.toString(),
            isMiniMode: isMiniMode,
          ),
        ),
        const Spacer(),
        if (isMiniMode)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: PropertyPriceItem(
              offerType: propertyEntity.type,
              price: propertyEntity.price,
            ),
          )
        else
          Icon(
            Icons.arrow_forward_ios,
            size: 18.r,
            color: context.theme.cardColor,
          ),
      ],
    );
  }
}

class PropertyPublisherImage extends StatelessWidget {
  final String? imageUrl;
  const PropertyPublisherImage({super.key, this.imageUrl});

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

class _PublisherNameAndHintSection extends StatelessWidget {
  const _PublisherNameAndHintSection({
    required this.title,
    required this.date,
    required this.isMiniMode,
  });

  final String title;
  final String date;
  final bool isMiniMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        isMiniMode ? 10 : 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: AppFontSize.light,
              color: context.theme.cardColor,
            ),
          ),
          if (isMiniMode)
            Text(
              getDate(context),
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: AppFontSize.light,
                color: context.theme.primaryColor.withOpacity(.25),
              ),
            )
          else
            Text(
              S.of(context).view_profile,
              style: context.textTheme.titleSmall?.copyWith(
                fontSize: AppFontSize.mini,
                color: context.theme.hoverColor,
              ),
            ),
        ],
      ),
    );
  }

  String getDate(BuildContext context) {
    return DateFormatter.getSuitableDateString(
      context: context,
      date: date,
      showFullDateHours: false,
    );
  }
}
