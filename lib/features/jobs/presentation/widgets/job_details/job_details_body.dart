import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/core/widgets/contact_with_bottom_sheet.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/widgets/job_details/job_details_pained_section.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/job_entity.dart';
import 'job_details_bottom_section.dart';

class JobDetailsBody extends StatelessWidget {
  const JobDetailsBody({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: JobDetailsPainedSection(
                jobEntity: jobEntity,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: JobDetailsBottomSection(
                jobEntity: jobEntity,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: SizedBox(
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomElevatedButton(
                label: S.of(context).apply_now,
                onPressed: () {
                  ContactWithBottomSheet.show(
                    context: context,
                    whatsapp: "+201030096242",
                    phoneNumber: "+201030096242",
                  );
                },
                width: context.width,
                height: 50.h,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
