import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SvgPicture.asset(
        AppSvg.marker,
      ),
    );
  }
}
