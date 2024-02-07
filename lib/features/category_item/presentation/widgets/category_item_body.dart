import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_back_button.dart';
import 'category_item_images_section.dart';
import 'category_item_profile_section.dart';

class CategoryItemBody extends StatelessWidget {
  const CategoryItemBody({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.h,
            primary: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CategoryItemImagesSection(
                imagesUrls: [
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                  categoryItemEntity.imageUrl,
                ],
              ),
            ),
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const CustomBackButtonWithCircle(
                color: AppColors.black,
              ),
            ),
            leadingWidth: 50.r,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                CategoryItemProfileSection(
                  categoryItemEntity: categoryItemEntity,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Some details about the place',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Some description text goes here...',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Review Summary:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Add review summary widgets here
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
