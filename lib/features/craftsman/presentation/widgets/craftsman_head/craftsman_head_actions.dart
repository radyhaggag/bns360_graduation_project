import 'package:bns360_graduation_project/features/craftsman/presentation/bloc/craftsman_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/providers/app_provider.dart';
import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/enums/user_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/language.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../core/widgets/icons/favorite_icon.dart';
import '../../../../../generated/l10n.dart';
import '../../../../conversations/domain/params/conversation_screen_params.dart';

class CraftsmanHeadActions extends StatelessWidget {
  const CraftsmanHeadActions({super.key, required this.craftsmanEntity});

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.currentLanguage == Language.english ? 0 : null,
      left: context.currentLanguage == Language.english ? null : 0,
      top: 10,
      child: !craftsmanEntity.isBelongToMe
          ? Row(
              children: [
                if (!AppProvider().isGuest)
                  _BuildBtn(
                    iconData: FeatherIcons.messageCircle,
                    onPressed: () {
                      final params = ConversationScreenParams(
                        participantEntity: ParticipantEntity(
                          id: craftsmanEntity.userId.toString(),
                          nameEN: craftsmanEntity.nameEN,
                          nameAR: craftsmanEntity.nameAR,
                          imageUrl: craftsmanEntity.profileImageUrl,
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
                const SizedBox(width: 10),
                FavoriteIcon(
                  addMargin: true,
                  notRounded: true,
                  isBusiness: false,
                  itemId: craftsmanEntity.id,
                  size: 35.r,
                ),
                const SizedBox(width: 10),
              ],
            )
          : CustomTextButton(
              label: S.of(context).edit,
              height: 30.h,
              onPressed: () async {
                await Navigator.of(context).pushNamed(
                  Routes.editService,
                  arguments: craftsmanEntity,
                );

                if (!context.mounted) return;

                context.read<CraftsmanBloc>().add(
                      GetCraftsmanEvent(
                        itemId: craftsmanEntity.id,
                      ),
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
    return CustomIconButton(
      icon: Icon(
        iconData,
        color: context.theme.cardColor,
      ),
      size: 35.r,
      padding: EdgeInsets.zero,
      backgroundColor: context.theme.highlightColor,
      onPressed: onPressed,
    );
  }
}
