import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/enums/user_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/language.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../core/widgets/icons/favorite_icon.dart';
import '../../../../conversations/domain/params/conversation_screen_params.dart';

class CraftsmanHeadActions extends StatelessWidget {
  const CraftsmanHeadActions({super.key, required this.craftsmanEntity});

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.currentLanguage == Language.english ? 0 : null,
      left: context.currentLanguage == Language.english ? null : 0,
      child: !craftsmanEntity.isBelongToMe
          ? Row(
              children: [
                _BuildBtn(
                  iconData: FeatherIcons.messageCircle,
                  onPressed: () {
                    final params = ConversationScreenParams(
                      participantEntity: ParticipantEntity(
                        id: craftsmanEntity.id.toString(),
                        nameEN: craftsmanEntity.name,
                        nameAR: craftsmanEntity.name,
                        imageUrl: craftsmanEntity.imageUrl,
                        userType: UserType.serviceProvider.id,
                      ),
                      craftsmanEntity: craftsmanEntity,
                    );
                    Navigator.of(context).pushNamed(
                      Routes.conversation,
                      arguments: params,
                    );
                  },
                ),
                FavoriteIcon(
                  addMargin: false,
                  notRounded: true,
                  isBusiness: false,
                  itemId: craftsmanEntity.id,
                ),
              ],
            )
          : CustomTextButton(
              label: S.of(context).edit,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Routes.editService,
                  arguments: craftsmanEntity,
                );
              },
              width: 100.w,
            ),
    );
  }
}

class _BuildBtn extends StatelessWidget {
  const _BuildBtn({
    required this.onPressed,
    required this.iconData,
  });

  final IconData iconData;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        size: 20.r,
        color: context.theme.cardColor,
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minHeight: 30.r, minWidth: 30.r),
      style: IconButton.styleFrom(
        backgroundColor: context.theme.highlightColor,
      ),
      onPressed: onPressed,
    );
  }
}
