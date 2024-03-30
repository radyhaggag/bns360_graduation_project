import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/price.dart';
import 'package:flutter/material.dart';

class PropertyPriceItem extends StatelessWidget {
  const PropertyPriceItem({
    super.key,
    required this.price,
    required this.offerType,
    this.fontSize,
  });

  final num price;
  final OfferType offerType;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      getPrice(context),
      style: context.textTheme.titleSmall?.copyWith(
        fontSize: fontSize ?? AppFontSize.light,
        color: context.theme.cardColor,
      ),
    );
  }

  String getPrice(BuildContext context) {
    return "${price.toPrice(context)}/${offerType.getLocalizedString(context)}";
  }
}
