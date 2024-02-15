import 'package:flutter/material.dart';

import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../widgets/craftsman_body.dart';

class CraftsmanScreen extends StatelessWidget {
  const CraftsmanScreen({
    super.key,
    required this.craftsmanEntity,
  });

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).listTileTheme.tileColor,
      body: CraftsmanBody(
        craftsmanEntity: craftsmanEntity,
      ),
    );
  }
}
