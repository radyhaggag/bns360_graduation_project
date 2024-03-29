import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_shimmer.dart';

class LazyLoadingCard extends StatelessWidget {
  const LazyLoadingCard({super.key, this.count = 1, this.enabled = true});
  final int count;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: templateShimmer,
    );
  }

  Widget get templateShimmer => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i <= count; i++) ...[
              Padding(
                padding: EdgeInsets.only(top: i == 1 ? 12.h : 0),
                child: _Item(enabled: enabled),
              ),
            ],
          ],
        ),
      );
}

class _Item extends StatelessWidget {
  const _Item({
    required this.enabled,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 130.h,
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(
        bottom: 5.h,
        left: 5.w,
        right: 5.w,
      ),
      decoration: BoxDecoration(
        color: context.theme.primaryColor.withAlpha(4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerWidget.square(
            size: 50.r,
            borderRadius: 10,
            enabled: enabled,
          ),
          10.horizontalSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(
                height: 18.h,
                width: 200.w,
                enabled: enabled,
              ),
              6.verticalSpace,
              ShimmerWidget.rectangular(
                height: 12.h,
                width: 200.w,
                enabled: enabled,
              ),
            ],
          ),
          Expanded(
            child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: ShimmerWidget.rectangular(
                  height: 8.h,
                  width: 40.w,
                  enabled: enabled,
                )),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
