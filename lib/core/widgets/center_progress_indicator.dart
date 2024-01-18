import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.5.r,
      width: 22.5.r,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
