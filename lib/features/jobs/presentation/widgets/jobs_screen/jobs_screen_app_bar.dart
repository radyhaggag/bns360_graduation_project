import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/providers/app_provider.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/icons/rounded_icon_btn.dart';
import '../../../../../core/widgets/input_fields/search_field.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/jobs_bloc.dart';

class JobsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JobsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      buildWhen: (previous, current) {
        return current is SearchIconToggled;
      },
      builder: (context, state) {
        final bloc = context.read<JobsBloc>();
        return Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: context.theme.listTileTheme.tileColor,
          ),
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 10.h,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).find_your_job,
                    style: context.theme.appBarTheme.titleTextStyle?.copyWith(
                      fontSize: AppFontSize.subTitle,
                    ),
                  ),
                  if (AppProvider().isGuest)
                    const SizedBox.shrink()
                  else
                    RoundedIconBtn(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.addJob);
                      },
                      icon: Icon(
                        Icons.add,
                        color: context.theme.highlightColor,
                      ),
                      size: 30.r,
                      backgroundColor: context.theme.cardColor,
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SearchField(
                  searchController: bloc.searchController,
                  onFieldSubmitted: () {
                    bloc.add(SearchOnJobs());
                  },
                  withPrefixIcon: true,
                  hintText: getHintText(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.h);

  String getHintText(BuildContext context) {
    return S.of(context).search_for_job;
  }
}
