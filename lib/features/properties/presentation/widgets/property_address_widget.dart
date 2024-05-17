import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyAddressWidget extends StatelessWidget {
  const PropertyAddressWidget({
    super.key,
    required this.markerColor,
    required this.address,
  });

  final Color markerColor;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: markerColor,
          size: 20.r,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            address,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: AppFontSize.light,
              color: context.theme.primaryColor.withOpacity(.6),
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
