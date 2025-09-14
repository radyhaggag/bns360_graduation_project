import 'package:bns360_graduation_project/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/icons/profile_circle_icon.dart';
import '../../../../generated/l10n.dart';

class SettingsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsScreenAppBar({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      title: Text(
        S.of(context).settings,
      ),
      centerTitle: false,
      titleSpacing: 20,
      actions: [
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            final profileImage = context.read<ProfileBloc>().profile?.imageUrl;
            return ProfileCircleIcon(imageUrl: profileImage);
          },
        ),
        const SizedBox(width: 20),
      ],
      leading: const CustomBackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
