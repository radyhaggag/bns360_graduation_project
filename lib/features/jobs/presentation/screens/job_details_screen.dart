import 'package:flutter/material.dart';

import '../../domain/entities/job_entity.dart';
import '../widgets/job_details/job_details_body.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JobDetailsBody(
        jobEntity: jobEntity,
      ),
    );
  }
}
