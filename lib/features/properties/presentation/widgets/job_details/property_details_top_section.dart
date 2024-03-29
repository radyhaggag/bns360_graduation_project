import 'package:bns360_graduation_project/core/helpers/localization_helper.dart';
import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/custom_back_button.dart';
import 'package:bns360_graduation_project/core/widgets/main_network_image.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_card/save_job_btn.dart';
import 'package:bns360_graduation_project/features/properties/domain/entities/property_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDetailsTopSection extends StatelessWidget {
  const PropertyDetailsTopSection({
    super.key,
    required this.propertyEntity,
  });

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 5.h),
        margin: EdgeInsets.only(bottom: 35.h),
        width: context.width,
        // height: context.height * .42,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(
                  color: AppColors.white,
                ),
                SaveJobBtn(notSavedColor: AppColors.white),
              ],
            ),
            ClipOval(
              child: MainNetworkImage(
                height: 70.r,
                width: 70.r,
                imageUrl: propertyEntity.publisher.imageUrl,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              propertyEntity.publisher.name,
              style: _textStyle1(context),
            ),
            const SizedBox(height: 8),
            Text(
              LocalizationHelper.getLocalizedString(
                context,
                ar: propertyEntity.publisher.userDescriptionAR ?? "",
                en: propertyEntity.publisher.userDescriptionEN ?? "",
              ),
              style: _textStyle2(context),
            ),
            SizedBox(height: 13.h),
            Text(
              propertyEntity.location,
              style: _textStyle3(context),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle? _textStyle1(BuildContext context) {
    return context.textTheme.titleSmall?.copyWith(
      color: AppColors.white,
      fontSize: AppFontSize.subTitle,
    );
  }

  TextStyle? _textStyle2(BuildContext context) {
    return context.textTheme.bodyLarge?.copyWith(
      color: AppColors.white,
      fontSize: AppFontSize.details,
    );
  }

  TextStyle? _textStyle3(BuildContext context) {
    return context.textTheme.titleMedium?.copyWith(
      color: AppColors.white,
      fontSize: AppFontSize.title,
    );
  }
}
