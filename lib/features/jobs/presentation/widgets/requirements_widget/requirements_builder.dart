import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums.dart';
import '../../bloc/jobs_bloc.dart';
import 'requirement_widget.dart';

class RequirementsBuilder extends StatelessWidget {
  const RequirementsBuilder({
    super.key,
    required this.isReadOnly,
    required this.withTranslation,
    this.language,
  });

  final bool isReadOnly;
  final bool withTranslation;
  final Language? language;

  List<String> _getRequirementsToView(BuildContext context) {
    final bloc = context.read<JobsBloc>();
    if (language != null) {
      return language == Language.arabic
          ? bloc.requirementsAr
          : bloc.requirementsEng;
    }
    final requirements = bloc.requirements(context);
    return requirements;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        final requirements = _getRequirementsToView(context);
        return Container(
          margin: EdgeInsets.only(
            top: _getRequirementsToView(context).isEmpty ? 0 : 10,
          ),
          child: Column(
            children: List.generate(
              requirements.length,
              (index) => RequirementWidget(
                requirement: requirements[index],
                index: index,
                isReadOnly: isReadOnly,
                withTranslation: withTranslation,
              ),
            ),
          ),
        );
      },
    );
  }
}
