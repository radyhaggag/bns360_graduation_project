import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'crafts_tab_bar.dart';
import 'craftsmen_builder.dart';

class CraftsBody extends StatelessWidget {
  const CraftsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        CraftsTabBar(),
        SizedBox(height: 15),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CraftsmenBuilder(),
          ),
        )
      ],
    );
  }
}
