import 'package:flutter/material.dart';

import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../widgets/category_item_body.dart';

class CategoryItemScreen extends StatelessWidget {
  const CategoryItemScreen({
    super.key,
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryItemBody(
        categoryItemEntity: categoryItemEntity,
      ),
    );
  }
}
