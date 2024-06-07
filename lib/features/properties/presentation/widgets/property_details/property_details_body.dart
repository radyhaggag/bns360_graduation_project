import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../core/widgets/contact_with_bottom_sheet.dart';
import '../../../../../generated/l10n.dart';
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
        if (!propertyEntity.isBelongToMe)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: SizedBox(
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomElevatedButton(
                  label: S.of(context).buy_now,
                  onPressed: () {
                    ContactWithBottomSheet.show(
                      context: context,
                      whatsapp: propertyEntity.contacts.whatsapp,
                      phoneNumber: propertyEntity.contacts.phoneNumber,
                    );
                  },
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
