import 'package:bns360_graduation_project/features/my_business/presentation/widgets/my_business_body.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/widgets/my_business_screen_app_bar.dart';
import 'package:flutter/material.dart';

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
