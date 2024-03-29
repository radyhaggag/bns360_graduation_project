import 'package:flutter/material.dart';

import '../widgets/add_property/add_property_app_bar.dart';
import '../widgets/add_property/add_property_body.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AddPropertyScreenAppBar(),
      body: AddPropertyBody(),
    );
  }
}
