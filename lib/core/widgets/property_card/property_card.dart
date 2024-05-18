import 'package:flutter/material.dart';

import '../../../features/properties/presentation/widgets/propert_area_widget.dart';
import '../../../features/properties/presentation/widgets/property_address_widget.dart';
import '../../../features/properties/presentation/widgets/property_publisher_section.dart';
import '../../helpers/localization_helper.dart';
import '../../shared_data/entities/property_entity.dart';
import '../../utils/extensions/context.dart';
import '../../utils/extensions/media_query.dart';
import 'property_card_images_section.dart';

part 'property_location_and_area_section.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
    required this.propertyEntity,
    this.moreWidget,
  });

  final PropertyEntity propertyEntity;
  final Widget? moreWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: context.width,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.theme.highlightColor,
        ),
        child: Column(
          children: [
            PropertyCardImagesSection(
              propertyEntity: propertyEntity,
              moreWidget: moreWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  PropertyPublisherSection(propertyEntity: propertyEntity),
                  const SizedBox(height: 5),
                  _PropertyLocationAndAreaSection(
                    propertyEntity: propertyEntity,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
