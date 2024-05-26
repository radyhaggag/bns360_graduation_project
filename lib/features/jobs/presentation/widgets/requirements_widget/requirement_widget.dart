import 'package:bns360_graduation_project/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets/app_svg.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/confirm_delete_pop_up.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/jobs_bloc.dart';
import 'add_requirement_dialog.dart';

class RequirementWidget extends StatelessWidget {
  const RequirementWidget({
    super.key,
    required this.requirement,
    required this.index,
    required this.isReadOnly,
    required this.withTranslation,
    required this.language,
  });

  final String requirement;
  final int index;
  final bool isReadOnly;
  final bool withTranslation;
  final Language language;

  _onTap(BuildContext context) {
    ConfirmationDialog.show(
      context,
      onConfirm: () {
        context.read<JobsBloc>().add(RemoveRequirementEvent(
              index: index,
              language: language,
            ));
        Navigator.pop(context);
      },
      message: S.of(context).remove_requirement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 5.h, start: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 10.r,
              height: 10.r,
              margin: EdgeInsets.only(top: 5.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.theme.hoverColor,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                requirement,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.hoverColor,
                ),
              ),
            ),
            if (!isReadOnly)
              InkWell(
                onTap: () {
                  AddRequirementDialog.show(
                    context: context,
                    onAdd: (value) {
                      context.read<JobsBloc>().add(
                            EditRequirementEvent(
                              requirement: value,
                              index: index,
                              context: context,
                              withTranslation: withTranslation,
                              language: language,
                            ),
                          );
                    },
                    initialValue: requirement,
                  );
                },
                child: SvgPicture.asset(
                  AppSvg.edit,
                  color: context.theme.cardColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
