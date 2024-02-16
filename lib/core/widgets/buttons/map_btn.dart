import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/route_config.dart';
import '../../../features/map/domain/params/map_params.dart';
import '../../../generated/l10n.dart';
import 'custom_buttons.dart';

class MapBtn extends StatelessWidget {
  const MapBtn({super.key, required this.mapParams});

  final MapParams mapParams;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: S.of(context).map,
      width: 90.w,
      height: 35.h,
      onPressed: () {
        Navigator.of(context).pushNamed(
          Routes.map,
          arguments: mapParams,
        );
      },
    );
  }
}
