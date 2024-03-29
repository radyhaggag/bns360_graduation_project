import 'package:flutter/material.dart';

import '../widgets/add_job/add_job_app_bar.dart';
import '../widgets/add_job/add_job_body.dart';

class AddJobScreen extends StatelessWidget {
  const AddJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AddJobScreenAppBar(),
      body: AddJobBody(),
    );
  }
}
