import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/features/conversations/presentation/bloc/conversations_bloc.dart';
import 'package:bns360_graduation_project/features/home/presentation/widgets/choose_account/choose_account_admin_pop_up.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/widgets/choose_account/choose_business_account_pop_up.dart';
import 'package:bns360_graduation_project/features/my_services/presentation/widgets/choose_account/choose_craftsman_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_data/entities/participant_entity.dart';
import '../../../../../generated/l10n.dart';

class ConversationsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationsScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationsBloc, ConversationsState>(
      builder: (context, state) {
        final currentParticipant =
            context.read<ConversationsBloc>().currentParticipant;
        final currentName = LocalizationHelper.getLocalizedString(
          context,
          ar: currentParticipant.nameAR ?? "",
          en: currentParticipant.nameEN ?? "",
        );
        return AppBar(
          title: Row(
            children: [
              Flexible(
                child: Text(
                  "${S.of(context).conversations} - $currentName",
                  style: context.textTheme.titleSmall,
                ),
              ),
              if (!AppProvider().isUser) ...[
                SizedBox(width: 10.w),
                IconButton(
                  onPressed: () {
                    if (AppProvider().isBusiness) {
                      ChooseBusinessAccountBody.showPopup(
                        context: context,
                        onSelectCategoryItem: (item) => _onSelectBusiness(
                          context,
                          item,
                        ),
                      );
                    } else if (AppProvider().isServiceProvider) {
                      ChooseCraftsmanAccountBody.showPopup(
                        context: context,
                        onSelect: (item) => _onSelectCraftsman(
                          context,
                          item,
                        ),
                      );
                    } else if (AppProvider().isAdmin) {
                      ChooseAdminAccountPopUp.showPopup(
                        context: context,
                        onSelectCategory: (item) =>
                            _onSelectBusiness(context, item),
                        onSelectCraftsman: (item) =>
                            _onSelectCraftsman(context, item),
                      );
                    }
                  },
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                ),
              ],
            ],
          ),
          leading: const SizedBox.shrink(),
          centerTitle: false,
          leadingWidth: 20,
        );
      },
    );
  }

  void _onSelectBusiness(BuildContext context, ParticipantEntity item) {
    Navigator.pop(context);

    context.read<ConversationsBloc>().add(
          SetCurrentParticipantEvent(
            participantEntity: item,
          ),
        );

    context.read<ConversationsBloc>().add(
          GetConversationsEvent(),
        );
  }

  void _onSelectCraftsman(BuildContext context, ParticipantEntity item) {
    Navigator.pop(context);

    context.read<ConversationsBloc>().add(
          SetCurrentParticipantEvent(
            participantEntity: item,
          ),
        );

    context.read<ConversationsBloc>().add(
          GetConversationsEvent(),
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
