import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/main_network_image.dart';

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
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.theme.cardColor,
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
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.theme.hintColor,
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
        color: context.theme.highlightColor,
      ),
      width: context.width * .9,
      height: 110.h,
      margin: EdgeInsets.only(top: 47.5.r, bottom: 10),
    );
  }
}
