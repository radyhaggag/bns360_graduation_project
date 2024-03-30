import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/features/properties/domain/entities/property_entity.dart';
import 'package:flutter/material.dart';

import '../widgets/property_details/property_details_body.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor(context),
        body: PropertyDetailsBody(
          propertyEntity: propertyEntity,
        ),
      ),
    );
  }
}
