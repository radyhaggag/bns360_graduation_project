import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class PropertyOfferTypeRadioTile extends StatelessWidget {
  const PropertyOfferTypeRadioTile({super.key, this.value, this.onChanged});

  final OfferType? value;
  final void Function(OfferType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).offer_type,
          style: context.textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).cardColor,
          ),
        ),
        _RadioItem(
          selectedValue: value,
          value: OfferType.sale,
          onChanged: onChanged,
        ),
        _RadioItem(
          selectedValue: value,
          value: OfferType.rent,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _RadioItem extends StatelessWidget {
  const _RadioItem({
    this.selectedValue,
    required this.value,
    required this.onChanged,
  });

  final OfferType value;
  final OfferType? selectedValue;
  final void Function(OfferType? p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<OfferType?>(
          value: value,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
        Text(
          value.getLocalizedString(context),
          style: context.textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).cardColor,
          ),
        ),
      ],
    );
  }
}
