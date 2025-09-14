import '../../../../../core/shared_data/entities/category_item_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/category_item/category_item_card.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/home_bloc.dart';

part 'explore_places_builder.dart';

class ExplorePlacesSection extends StatelessWidget {
  const ExplorePlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).places_to_explore,
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(height: 15),
        const _ExplorePlacesBuilder(),
      ],
    );
  }
}
