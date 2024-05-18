import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/route_config.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../generated/l10n.dart';

class AddServiceButton extends StatelessWidget {
  const AddServiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.addService);
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
            S.of(context).add_service,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.theme.cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
