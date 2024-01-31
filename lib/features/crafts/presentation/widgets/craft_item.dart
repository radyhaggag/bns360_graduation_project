import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../bloc/crafts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CraftItem extends StatelessWidget {
  const CraftItem({
    super.key,
    required this.craftEntity,
    required this.isSelected,
  });
  final CraftEntity craftEntity;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: isSelected
          ? null
          : () {
              context.read<CraftsBloc>().add(GetCraftItemsByIdEvent(
                    id: craftEntity.id,
                  ));
            },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          LocalizationHelper.getLocalizedString(
            context,
            ar: craftEntity.nameAR,
            en: craftEntity.nameEN,
          ),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: AppFontSize.light,
                color: isSelected
                    ? AppColors.white
                    : AppColors.black.withOpacity(.4),
              ),
        ),
      ),
    );
  }

  static Widget empty() {
    return Container(
      padding: const EdgeInsets.all(5),
      // margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
