import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/features/properties/domain/entities/property_entity.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'property_details_bottom_section.dart';
import 'property_details_pained_section.dart';

class PropertyDetailsBody extends StatelessWidget {
  const PropertyDetailsBody({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: PropertyDetailsPainedSection(
                propertyEntity: propertyEntity,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: PropertyDetailsBottomSection(
                propertyEntity: propertyEntity,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: SizedBox(
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomElevatedButton(
                label: S.of(context).apply_now,
                onPressed: () {},
                width: context.width,
                height: 50.h,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
