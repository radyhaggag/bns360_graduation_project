import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/jobs_bloc.dart';
import 'requirement_widget.dart';

class RequirementsBuilder extends StatelessWidget {
  const RequirementsBuilder({
    super.key,
    this.requirements,
    required this.isReadOnly,
  });

  final List<String>? requirements;
  final bool isReadOnly;

  List<String> _getRequirementsToView(BuildContext context) {
    final addRequirements = context.read<JobsBloc>().requirements;
    if (isReadOnly) {
      return requirements ?? [];
    }

    return addRequirements;
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
              ),
            ),
          ),
        );
      },
    );
  }
}
