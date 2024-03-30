import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class PropertyPriceItem extends StatelessWidget {
  const PropertyPriceItem({
    super.key,
    required this.price,
    required this.offerType,
  });

  final num price;
  final OfferType offerType;

  @override
  Widget build(BuildContext context) {
    return Text(
      getPrice(context),
      style: context.textTheme.titleSmall?.copyWith(
        fontSize: AppFontSize.light,
        color: context.theme.cardColor,
      ),
    );
  }

  String getPrice(BuildContext context) {
    final egp = S.of(context).egypt_currency;
    return "$egp $price/${offerType.getLocalizedString(context)}";
  }
}
