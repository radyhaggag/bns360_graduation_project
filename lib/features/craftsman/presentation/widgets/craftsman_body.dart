import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/widgets/reviews/main_review_summary_card/main_review_summary_card.dart';
import 'craftsman_description.dart';
import 'craftsman_head/craftsman_head_sliver.dart';
import 'craftsman_info/craftsman_info_section.dart';
import '../../../../core/widgets/buttons/write_review_btn.dart';

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
                  MainReviewSummaryCard(
                    numOfRatings: craftsmanEntity.numOfRatings,
                    starsCount: craftsmanEntity.averageRatings,
                    onViewAllTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.craftsmanReviewSummary,
                        arguments: craftsmanEntity,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
              vertical: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: WriteReviewBtn(
                addReviewCallback: (rating, value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
