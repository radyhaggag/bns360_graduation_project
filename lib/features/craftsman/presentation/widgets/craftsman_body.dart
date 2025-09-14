import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import 'craftsman_description.dart';
import 'craftsman_head/craftsman_head_sliver.dart';
import 'craftsman_info/craftsman_info_section.dart';
import 'craftsman_review_summary_section.dart';
import 'craftsman_work_samples_section.dart';
import 'send_craftsman_review_section.dart';

class CraftsmanBody extends StatelessWidget {
  const CraftsmanBody({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CraftsmanHeadSliver(
              craftsmanEntity: craftsmanEntity,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  CraftsmanDescription(
                    description: LocalizationHelper.getLocalizedString(
                      context,
                      ar: craftsmanEntity.descriptionAR,
                      en: craftsmanEntity.descriptionEN,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CraftsmanInfoSection(
                    craftsmanEntity: craftsmanEntity,
                  ),
                  const SizedBox(height: 10),
                  CraftsManWorkSamplesSection(
                    imagesUrls: craftsmanEntity.serviceImages,
                  ),
                  const SizedBox(height: 10),
                  const CraftsmanReviewSummarySection(
                    showViewAllBtn: true,
                  ),
                ],
              ),
            ),
          ),
          if (!craftsmanEntity.isBelongToMe)
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 50.w,
                vertical: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: SendCraftsmanReviewSection(
                  itemId: craftsmanEntity.id,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
