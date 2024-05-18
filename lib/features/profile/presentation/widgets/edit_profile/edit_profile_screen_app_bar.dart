import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_back_button.dart';

class EditProfileScreenAppBar extends StatelessWidget {
  const EditProfileScreenAppBar({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      leading: CustomBackButton(
        color: Colors.white,
      ),
    );
  }
}
