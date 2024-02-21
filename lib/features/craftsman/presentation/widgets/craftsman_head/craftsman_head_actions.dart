import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/extensions/language.dart';
import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../conversations/domain/params/conversation_screen_params.dart';

class CraftsmanHeadActions extends StatelessWidget {
  const CraftsmanHeadActions({super.key, required this.craftsmanEntity});

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.currentLanguage == Language.english ? 0 : null,
      left: context.currentLanguage == Language.english ? null : 0,
      child: Row(
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
              );
              Navigator.of(context).pushNamed(
                Routes.conversation,
                arguments: params,
              );
            },
          ),
          _BuildBtn(
            iconData: FeatherIcons.heart,
            onPressed: () {},
          ),
        ],
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
        color: Theme.of(context).cardColor,
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minHeight: 30.r, minWidth: 30.r),
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).highlightColor,
      ),
      onPressed: onPressed,
    );
  }
}
