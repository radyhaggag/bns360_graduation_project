import 'package:bns360_graduation_project/core/shared_data/entities/participant_entity.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/widgets/choose_account/choose_business_account_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/providers/app_provider.dart';
import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../generated/l10n.dart';
import '../../../bottom_navigation/presentation/bloc/bottom_navigation_bloc.dart';
import '../../../conversations/presentation/bloc/conversations_bloc.dart';
import '../../../my_services/presentation/widgets/choose_account/choose_craftsman_pop_up.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import 'choose_account/choose_account_admin_pop_up.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: AppBar(
        centerTitle: false,
        title: Text(
          S.of(context).appName,
        ),
        titleSpacing: 20,
        actions: [
          if (!AppProvider().isGuest)
            IconButton(
              icon: const Icon(
                FeatherIcons.messageCircle,
                size: 30,
              ),
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
                } else if (AppProvider().isUser) {
                  context.read<BottomNavBarBloc>().add(
                        ChangeBottomNavbarIndex(
                          index:
                              context.read<BottomNavBarBloc>().views.length - 2,
                        ),
                      );

                  context
                      .read<ConversationsBloc>()
                      .add(GetConversationsEvent());
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
            ),
          IconButton(
            icon: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return ProfileCircleIcon(
                  imageUrl: context.read<ProfileBloc>().profile?.imageUrl,
                );
              },
            ),
            onPressed: () {
              context.read<BottomNavBarBloc>().add(
                    ChangeBottomNavbarIndex(
                      index: context.read<BottomNavBarBloc>().views.length - 1,
                    ),
                  );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  _onSelectBusiness(BuildContext context, ParticipantEntity item) {
    Navigator.pop(context);

    context.read<ConversationsBloc>().add(
          SetCurrentParticipantEvent(
            participantEntity: item,
          ),
        );

    context.read<BottomNavBarBloc>().add(
          ChangeBottomNavbarIndex(
            index: context.read<BottomNavBarBloc>().views.length - 2,
          ),
        );
  }

  _onSelectCraftsman(BuildContext context, ParticipantEntity item) {
    Navigator.pop(context);

    context.read<ConversationsBloc>().add(
          SetCurrentParticipantEvent(
            participantEntity: item,
          ),
        );

    context.read<BottomNavBarBloc>().add(
          ChangeBottomNavbarIndex(
            index: context.read<BottomNavBarBloc>().views.length - 2,
          ),
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
