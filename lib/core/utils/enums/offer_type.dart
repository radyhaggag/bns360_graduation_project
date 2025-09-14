import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

enum OfferType {
  sale(0),
  rent(1);

  const OfferType(this.id);

  final int id;

  static OfferType fromId(int id) {
    if (id == 0) return OfferType.sale;
    return OfferType.rent;
  }

  String getLocalizedString(BuildContext context) {
    return switch (this) {
      sale => S.of(context).sale,
      rent => S.of(context).rent
    };
  }
}
