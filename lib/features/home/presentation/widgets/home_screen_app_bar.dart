import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/providers/app_provider.dart';
import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../generated/l10n.dart';
import '../../../bottom_navigation/presentation/bloc/bottom_navigation_bloc.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';

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
                // Navigator.of(context).pushNamed(Routes.conversations);
                context.read<BottomNavBarBloc>().add(
                      ChangeBottomNavbarIndex(
                        index:
                            context.read<BottomNavBarBloc>().views.length - 2,
                      ),
                    );
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

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
