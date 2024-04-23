import 'package:bns360_graduation_project/core/utils/constants.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/widgets/add_business_button.dart';
import 'package:flutter/material.dart';

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
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AddBusinessButton(),
            SizedBox(height: 15),
            MyBusinessItemsBuilder(),
          ],
        ),
      ),
    );
  }
}
