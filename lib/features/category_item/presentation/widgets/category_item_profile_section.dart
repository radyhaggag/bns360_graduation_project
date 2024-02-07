import 'package:bns360_graduation_project/core/widgets/icons/profile_circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_data/entities/category_item_entity.dart';

class CategoryItemProfileSection extends StatelessWidget {
  const CategoryItemProfileSection({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: ProfileCircleIcon(
            height: 60.r,
            width: 60.r,
            imageUrl: categoryItemEntity.imageUrl,
          ),
        ),
      ],
    );
  }
}
