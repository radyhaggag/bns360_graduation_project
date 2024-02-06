import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/edit_profile/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: EditProfileBody(),
    );
  }
}
