import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/features/map/domain/params/map_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/extensions/language.dart';
import '../../../../../core/widgets/buttons/map_btn.dart';
import '../../../../../generated/l10n.dart';

part 'craftsman_contact_info.dart';
part 'craftsman_location.dart';
part 'craftsman_status.dart';

class CraftsmanInfoSection extends StatelessWidget {
  const CraftsmanInfoSection({super.key, required this.craftsmanEntity});

  final CraftsmanEntity craftsmanEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _ItemStatusWidget(
            start: DateTime.now().subtract(const Duration(hours: 5)),
            end: DateTime.now().add(const Duration(hours: 5)),
          ),
          const SizedBox(height: 15),
          const _CraftsmanLocation(
            location: 'Elkornish, Beni suef',
          ),
          const SizedBox(height: 15),
          const _CraftsmanContactInfo(
            contactInfo: ["01030096242"],
          ),
        ],
      ),
    );
  }
}
