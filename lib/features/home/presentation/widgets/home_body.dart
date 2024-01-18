import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'explore_places_section/explore_places_section.dart';
import 'home_slider/home_slider_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSliderSection(),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: ExplorePlacesSection(),
            ),
          ],
        ),
      ),
    );
  }
}
