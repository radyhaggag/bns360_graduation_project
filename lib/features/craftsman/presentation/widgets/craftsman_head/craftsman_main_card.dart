import 'package:bns360_graduation_project/core/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/constants.dart';
import 'package:bns360_graduation_project/core/widgets/main_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/craftsman_entity.dart';

class CraftsmanMainCard extends StatelessWidget {
  const CraftsmanMainCard({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const _BuildBackground(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: MainNetworkImage(
                  imageUrl: craftsmanEntity.imageUrl,
                  width: 90.r,
                  height: 90.r,
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding + 10,
                ),
                child: FittedBox(
                  child: Text(
                    craftsmanEntity.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).cardColor,
                          fontSize: AppFontSize.subTitle,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ),
              Text(
                LocalizationHelper.getLocalizedString(
                  context,
                  ar: craftsmanEntity.craft.nameAR,
                  en: craftsmanEntity.craft.nameEN,
                ),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).hintColor,
                      fontSize: AppFontSize.details,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildBackground extends StatelessWidget {
  const _BuildBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).highlightColor,
      ),
      width: context.width * .9,
      height: 120.h,
      margin: EdgeInsets.only(top: 47.5.r, bottom: 10),
    );
  }
}
