import 'package:flutter/material.dart';

import '../widgets/my_business_body.dart';
import '../widgets/my_business_screen_app_bar.dart';

class MyBusinessScreen extends StatelessWidget {
  const MyBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: MyBusinessScreenAppBar(),
      body: MyBusinessBody(),
    );
  }
}
