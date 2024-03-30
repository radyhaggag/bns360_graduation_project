import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/buttons/map_btn.dart';
import '../../../../map/domain/params/map_params.dart';
import '../../../domain/entities/property_entity.dart';
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
        PropertyAddressWidget(
          address: propertyEntity.address,
          markerColor: context.theme.hoverColor,
        ),
        MapBtn(
          borderRadius: BorderRadius.circular(8),
          mapParams: MapParams(
            lat: propertyEntity.lat,
            lng: propertyEntity.lng,
            location: propertyEntity.address,
          ),
        )
      ],
    );
  }
}
