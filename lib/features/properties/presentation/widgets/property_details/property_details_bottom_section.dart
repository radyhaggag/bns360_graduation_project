import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/widgets/description_widget.dart';
import '../property_publisher_section.dart';
import 'property_details_area_and_price_section.dart';
import 'property_details_location_section.dart';

class PropertyDetailsBottomSection extends StatelessWidget {
  const PropertyDetailsBottomSection({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: context.theme.highlightColor,
          ),
          child: Column(
            children: [
              PropertyDetailsLocationSection(
                propertyEntity: propertyEntity,
              ),
              10.verticalSpace,
              PropertyDetailsAreaAndPriceSection(
                price: propertyEntity.price,
                area: propertyEntity.area,
                offerType: propertyEntity.offerType,
              ),
            ],
          ),
        ),
        10.verticalSpace,
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.theme.highlightColor,
          ),
          child: PropertyPublisherSection(
            propertyEntity: propertyEntity,
            isMiniMode: false,
          ),
        ),
        10.verticalSpace,
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: DescriptionSection(
            description: propertyEntity.description,
          ),
        ),
      ],
    );
  }
}
