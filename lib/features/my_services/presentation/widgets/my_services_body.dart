import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions/media_query.dart';
import 'add_service_button.dart';
import 'my_services_items/my_services_items_builder.dart';

class MyServicesBody extends StatelessWidget {
  const MyServicesBody({super.key});

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
            AddServiceButton(),
            SizedBox(height: 15),
            MyServicesItemsBuilder(),
          ],
        ),
      ),
    );
  }
}
