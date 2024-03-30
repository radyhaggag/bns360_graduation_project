import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';
import 'package:bns360_graduation_project/features/properties/presentation/widgets/propert_area_widget.dart';
import 'package:flutter/material.dart';

import '../property_price_item.dart';

class PropertyDetailsAreaAndPriceSection extends StatelessWidget {
  const PropertyDetailsAreaAndPriceSection({
    super.key,
    required this.price,
    required this.area,
    required this.offerType,
  });

  final num price;
  final String area;
  final OfferType offerType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PropertyAreaWidget(
          area: area,
          fontSize: AppFontSize.details,
        ),
        PropertyPriceItem(
          price: price,
          fontSize: AppFontSize.details,
          offerType: offerType,
        ),
      ],
    );
  }
}
