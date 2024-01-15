import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'explore_places_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          ExplorePlacesSection(),
        ],
      ),
    );
  }
}
