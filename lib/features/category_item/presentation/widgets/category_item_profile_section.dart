import 'package:bns360_graduation_project/features/category_item/presentation/bloc/category_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/providers/app_provider.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/enums/user_type.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../core/widgets/icons/favorite_icon.dart';
import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../core/widgets/icons/rounded_icon_btn.dart';
import '../../../../generated/l10n.dart';
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
            withImageView: true,
            height: 60.r,
            width: 60.r,
            imageUrl: categoryItemEntity.profileImageName,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _TitleAndTypeSection(categoryItemEntity: categoryItemEntity),
        ),
        const SizedBox(width: 10),
        if (categoryItemEntity.isBelongToMe)
          CustomTextButton(
            label: S.of(context).edit,
            width: 50.w,
            onPressed: () async {
              await Navigator.of(context).pushNamed(
                Routes.editBusiness,
                arguments: categoryItemEntity,
              );

              if (!context.mounted) return;

              context.read<CategoryItemBloc>().add(
                    GetCategoryItemEvent(
                      itemId: categoryItemEntity.id,
                    ),
                  );
            },
          )
        else ...[
          if (!AppProvider().isGuest)
            RoundedIconBtn(
              size: 35.r,
              icon: const Icon(FeatherIcons.messageCircle),
              addMargin: false,
              onPressed: () {
                final params = ConversationScreenParams(
                  participantEntity: ParticipantEntity(
                    id: categoryItemEntity.userId.toString(),
                    nameEN: categoryItemEntity.userName,
                    nameAR: categoryItemEntity.userName,
                    imageUrl: categoryItemEntity.userImage,
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
          const SizedBox(width: 10),
          FavoriteIcon(
            addMargin: false,
            isBusiness: true,
            itemId: categoryItemEntity.id,
          ),
        ],
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
            ar: categoryItemEntity.businessNameArabic,
            en: categoryItemEntity.businessNameEnglish,
          ),
          style: context.textTheme.titleSmall?.copyWith(
            color: context.theme.cardColor,
          ),
        ),
        Text(
          LocalizationHelper.getLocalizedString(
            context,
            ar: categoryItemEntity.categoriesModel.categoryNameArabic,
            en: categoryItemEntity.categoriesModel.categoryNameEnglish,
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
