import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_styles.dart';
import '../bloc/crafts_bloc.dart';

class CraftsSearchField extends StatelessWidget {
  const CraftsSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 45,
        child: TextFormField(
          style: AppStyles.getBoldStyle(
            fontSize: AppFontSize.light,
          ),
          controller: context.read<CraftsBloc>().searchController,
          textAlign: TextAlign.center,
          cursorHeight: 18,
          decoration: const InputDecoration(),
        ),
      ),
    );
  }
}
