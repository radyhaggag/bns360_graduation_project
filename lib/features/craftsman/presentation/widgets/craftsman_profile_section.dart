import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/widgets/icons/favorite_icon.dart';
import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../core/widgets/icons/rounded_icon_btn.dart';

class CraftsmanProfileSection extends StatelessWidget {
  const CraftsmanProfileSection({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: ProfileCircleIcon(
            height: 55.r,
            width: 55.r,
            imageUrl: craftsmanEntity.imageUrl,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _TitleAndTypeSection(craftsmanEntity: craftsmanEntity),
        ),
        const SizedBox(width: 10),
        const RoundedIconBtn(
          icon: Icon(FeatherIcons.messageCircle),
          addMargin: false,
        ),
        const FavoriteIcon(addMargin: false),
      ],
    );
  }
}

class _TitleAndTypeSection extends StatelessWidget {
  const _TitleAndTypeSection({
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          craftsmanEntity.name,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).cardColor,
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
                fontSize: AppFontSize.light,
              ),
        ),
      ],
    );
  }
}
