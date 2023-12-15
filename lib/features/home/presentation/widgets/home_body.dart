import 'package:bns360_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';

import 'places_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          PlacesBuilder(),
        ],
      ),
    );
  }
}
