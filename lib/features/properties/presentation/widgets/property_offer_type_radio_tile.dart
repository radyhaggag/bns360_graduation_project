import 'package:bns360_graduation_project/core/utils/enums/offer_type.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyOfferTypeRadioTile extends StatelessWidget {
  const PropertyOfferTypeRadioTile({super.key, this.value, this.onChanged});

  final OfferType? value;
  final void Function(OfferType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsetsDirectional.only(start: 40.w),
            child: _RadioItem(
              selectedValue: value,
              value: OfferType.sale,
              onChanged: onChanged,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsetsDirectional.only(start: 125.w),
            child: _RadioItem(
              selectedValue: value,
              value: OfferType.rent,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  double firstItemMargin(BuildContext context) {
    if (context.brightness == Brightness.light) {
      return 40.w;
    }
    return 25.w;
  }

  double secondItemMargin(BuildContext context) {
    if (context.brightness == Brightness.light) {
      return 125.w;
    }
    return 140.w;
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

  bool get _isSelected {
    return selectedValue == value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _isSelected ? null : () => onChanged?.call(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color(context),
        ),
        child: Text(
          value.getLocalizedString(context),
          style: context.textTheme.titleSmall?.copyWith(
            color: _isSelected
                ? context.theme.highlightColor
                : context.theme.cardColor,
          ),
        ),
      ),
    );
  }

  Color color(BuildContext context) {
    const lightUnselectedColor = Color(0xffF5F5F5);
    const darkUnselectedColor = Color.fromARGB(255, 71, 71, 71);
    Color basedOnTheme() {
      return context.brightness == Brightness.light
          ? lightUnselectedColor
          : darkUnselectedColor;
    }

    return _isSelected ? context.theme.cardColor : basedOnTheme();
  }
}
