import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions/media_query.dart';
import 'add_business_button.dart';
import 'my_business_items/my_business_items_builder.dart';

class MyBusinessBody extends StatelessWidget {
  const MyBusinessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddBusinessButton(),
          SizedBox(height: 15),
          Expanded(
            child: MyBusinessItemsBuilder(),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
