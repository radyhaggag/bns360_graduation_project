import '../bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/edit_profile/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccessState) {
            Navigator.of(context).pop();
          }
        },
        child: const EditProfileBody(),
      ),
    );
  }
}
