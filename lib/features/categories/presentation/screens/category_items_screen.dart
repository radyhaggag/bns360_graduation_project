import 'package:flutter/material.dart';

import '../../../../core/shared_data/entities/category_entity.dart';
import '../widgets/category_items/category_items_body.dart';
import '../widgets/category_items/category_items_screen_app_bar.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({
    super.key,
    required this.categoryEntity,
  });

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryItemsScreenAppBar(
        categoryEntity: categoryEntity,
      ),
      body: const CategoryItemsBody(),
    );
  }
}
