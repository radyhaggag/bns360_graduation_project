import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:flutter/material.dart';

import 'profile_card_section_with_background.dart';
import 'profile_list_items_section.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const ProfileCardSectionWithBackground(),
          Positioned(
            top: context.height * .31,
            child: const ProfileListItemsSection(),
          ),
        ],
      ),
    );
  }
}
