import 'package:bns360_graduation_project/core/utils/constants.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/widgets/add_business_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBusinessBody extends StatelessWidget {
  const MyBusinessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 15.h,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddBusinessButton(),
        ],
      ),
    );
  }
}
