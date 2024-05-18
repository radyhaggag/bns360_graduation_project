import '../../../../../core/helpers/localization_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/buttons/map_btn.dart';
import '../../../../map/domain/params/map_params.dart';
import '../property_address_widget.dart';

class PropertyDetailsLocationSection extends StatelessWidget {
  const PropertyDetailsLocationSection({
    super.key,
    required this.propertyEntity,
  });

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PropertyAddressWidget(
            address: getAddress(context),
            markerColor: context.theme.hoverColor,
          ),
        ),
        const SizedBox(width: 10),
        MapBtn(
          borderRadius: BorderRadius.circular(8),
          mapParams: MapParams(
            lat: propertyEntity.latitude,
            lng: propertyEntity.longitude,
            location: getAddress(context),
          ),
        )
      ],
    );
  }

  String getAddress(BuildContext context) {
    return LocalizationHelper.getLocalizedString(
      context,
      ar: propertyEntity.arabicAddress,
      en: propertyEntity.englishAddress,
    );
  }
}
