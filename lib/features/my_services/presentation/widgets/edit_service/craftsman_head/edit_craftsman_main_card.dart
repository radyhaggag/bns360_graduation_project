import '../../../../../../core/utils/constants.dart';
import '../../../bloc/my_services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../core/helpers/localization_helper.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/extensions/context.dart';
import '../../../../../../core/utils/extensions/media_query.dart';
import 'edit_craftsman_image_section.dart';

class EditCraftsmanMainCard extends StatelessWidget {
  const EditCraftsmanMainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const _BuildBackground(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const EditCraftsmanImageSection(),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding + 10,
                ),
                child: FittedBox(
                  child: ReactiveFormConsumer(
                    builder: (context, formGroup, child) => Text(
                      getLocalizedName(context, formGroup),
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.theme.cardColor,
                        fontSize: AppFontSize.subTitle,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              BlocBuilder<MyServicesBloc, MyServicesState>(
                builder: (context, state) {
                  final craft =
                      context.read<MyServicesBloc>().selectedServiceCraft;
                  return Text(
                    LocalizationHelper.getLocalizedString(
                      context,
                      ar: craft?.nameAR ?? "",
                      en: craft?.nameEN ?? "",
                    ),
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.theme.hintColor,
                      fontSize: AppFontSize.details,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getLocalizedName(BuildContext context, FormGroup formGroup) {
    return LocalizationHelper.getLocalizedString(
      context,
      ar: formGroup.controls["name_ar"]?.value as String,
      en: formGroup.controls["name_en"]?.value as String,
    );
  }
}

class _BuildBackground extends StatelessWidget {
  const _BuildBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.theme.highlightColor,
      ),
      width: context.width * .9,
      height: 110.h,
      margin: EdgeInsets.only(top: 47.5.r, bottom: 10),
    );
  }
}
