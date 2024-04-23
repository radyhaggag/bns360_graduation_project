import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/shared_data/entities/craftsman_entity.dart';
import 'edit_craftsman_head.dart';

class EditCraftsmanHeadSliver extends SliverPersistentHeaderDelegate {
  final CraftsmanEntity craftsmanEntity;
  EditCraftsmanHeadSliver({
    required this.craftsmanEntity,
  });

  final _minHeight = 200.h;
  final _maxHeight = 225.h;

  @override
  double get minExtent => _minHeight;

  @override
  double get maxExtent => math.max(_maxHeight, _minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: child(context),
    );
  }

  Widget child(BuildContext context) {
    return EditCraftsmanHead(
      craftsmanEntity: craftsmanEntity,
    );
  }

  @override
  bool shouldRebuild(EditCraftsmanHeadSliver oldDelegate) {
    return _maxHeight != oldDelegate._maxHeight ||
        _minHeight != oldDelegate._minHeight ||
        child != oldDelegate.child;
  }
}
