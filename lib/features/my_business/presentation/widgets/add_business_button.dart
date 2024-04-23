import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBusinessButton extends StatelessWidget {
  const AddBusinessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.addBusiness);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle,
            color: context.theme.cardColor,
            size: 25.r,
          ),
          10.horizontalSpace,
          Text(
            S.of(context).add_business,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.theme.cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
