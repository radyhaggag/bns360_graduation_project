import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions/media_query.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({
    super.key,
    this.color,
    this.value,
    this.size,
  });

  final Color? color;
  final double? value;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 22.5.r,
      width: size ?? 22.5.r,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: color,
        value: value,
      ),
    );
  }
}

class FullScreenLoadingIndicator extends StatelessWidget {
  const FullScreenLoadingIndicator({
    super.key,
    this.color,
    this.height,
  });

  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? context.height,
      width: context.width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CenterProgressIndicator(color: color),
        ],
      ),
    );
  }
}
