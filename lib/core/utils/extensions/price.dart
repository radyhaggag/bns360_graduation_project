import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension PriceExtension on num {
  String toPrice(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final currencySymbol = (locale.languageCode == 'ar') ? 'ج.م ' : 'EGP ';

    final priceFormat = NumberFormat.currency(
      locale: locale.toString(),
      symbol: currencySymbol,
    );

    // Format the price using NumberFormat
    final formattedPrice = priceFormat.format(this);

    return formattedPrice;
  }
}
