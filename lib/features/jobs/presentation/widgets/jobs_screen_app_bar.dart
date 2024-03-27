import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/media_query.dart';
import '../../../../core/widgets/input_fields/search_field.dart';
import '../../../../generated/l10n.dart';
import '../bloc/jobs_bloc.dart';

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
            color: Theme.of(context).appBarTheme.backgroundColor,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 60,
          margin: const EdgeInsets.only(top: 36),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).find_your_job,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ],
              ),
              Expanded(
                child: SearchField(
                  searchController: bloc.searchController,
                  onFieldSubmitted: () {
                    bloc.add(SearchOnJobs());
                  },
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
  Size get preferredSize => const Size.fromHeight(100);

  String getHintText(BuildContext context) {
    return S.of(context).search_for_job;
  }
}
