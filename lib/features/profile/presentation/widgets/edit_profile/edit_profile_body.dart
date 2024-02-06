import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../bloc/profile_bloc.dart';
import 'edit_profile_bottom_section.dart';
import 'edit_profile_screen_app_bar.dart';
import 'edit_profile_top_section.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final profile = context.read<ProfileBloc>().profile;

        return DataStateWidget(
          isLoading: state is GetProfileLoadingState || profile == null,
          isError: state is GetProfileErrorState,
          errorMessage: (state is GetProfileErrorState) ? state.message : "",
          isLoaded: profile != null,
          loadedWidget: profile != null
              ? _LoadedWidget(profile: profile)
              : const SizedBox.shrink(),
          loadingWidget: const FullScreenLoadingIndicator(
            color: AppColors.white,
          ),
        );
      },
    );
  }
}

class _LoadedWidget extends StatelessWidget {
  const _LoadedWidget({required this.profile});

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const EditProfileScreenAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              EditProfileTopSection(profile: profile),
            ],
          ),
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: EditProfileBottomSection(),
        ),
      ],
    );
  }
}
