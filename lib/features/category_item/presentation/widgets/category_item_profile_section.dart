import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/enums/user_type.dart';
import '../../../../core/widgets/icons/favorite_icon.dart';
import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../core/widgets/icons/rounded_icon_btn.dart';
import '../../../conversations/domain/params/conversation_screen_params.dart';

class CategoryItemProfileSection extends StatelessWidget {
  const CategoryItemProfileSection({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: ProfileCircleIcon(
            height: 55.r,
            width: 55.r,
            imageUrl: categoryItemEntity.imageUrl,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _TitleAndTypeSection(categoryItemEntity: categoryItemEntity),
        ),
        const SizedBox(width: 10),
        RoundedIconBtn(
          icon: const Icon(FeatherIcons.messageCircle),
          addMargin: false,
          onPressed: () {
            final params = ConversationScreenParams(
              participantEntity: ParticipantEntity(
                id: categoryItemEntity.id.toString(),
                nameEN: categoryItemEntity.nameEN,
                nameAR: categoryItemEntity.nameAR,
                imageUrl: categoryItemEntity.imageUrl,
                userType: UserType.businessOwner.id,
              ),
              categoryItemEntity: categoryItemEntity,
            );
            Navigator.of(context).pushNamed(
              Routes.conversation,
              arguments: params,
            );
          },
        ),
        const FavoriteIcon(addMargin: false),
      ],
    );
  }
}

class _TitleAndTypeSection extends StatelessWidget {
  const _TitleAndTypeSection({
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalizationHelper.getLocalizedString(
            context,
            ar: categoryItemEntity.nameAR,
            en: categoryItemEntity.nameEN,
          ),
          style: context.textTheme.titleSmall?.copyWith(
            color: context.theme.cardColor,
          ),
        ),
        Text(
          LocalizationHelper.getLocalizedString(
            context,
            ar: categoryItemEntity.category.nameAR,
            en: categoryItemEntity.category.nameEN,
          ),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.hintColor,
            fontSize: AppFontSize.light,
          ),
        ),
      ],
    );
  }
}
