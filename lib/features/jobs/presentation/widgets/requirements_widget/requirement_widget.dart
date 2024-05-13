import 'package:bns360_graduation_project/core/utils/assets/app_svg.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/confirm_delete_pop_up.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/requirements_widget/add_requirement_dialog.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/jobs_bloc.dart';

class RequirementWidget extends StatelessWidget {
  const RequirementWidget({
    super.key,
    required this.requirement,
    required this.index,
    required this.isReadOnly,
    required this.withTranslation,
  });

  final String requirement;
  final int index;
  final bool isReadOnly;
  final bool withTranslation;

  _onTap(BuildContext context) {
    ConfirmationDialog.show(
      context,
      onConfirm: () {
        context.read<JobsBloc>().add(RemoveRequirementEvent(index: index));
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
