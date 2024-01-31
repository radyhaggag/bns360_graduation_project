import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_styles.dart';
import '../bloc/crafts_bloc.dart';

class CraftsSearchField extends StatelessWidget {
  const CraftsSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        // vertical: 10,
      ),
      height: 30.h,
      child: BlocBuilder<CraftsBloc, CraftsState>(
        builder: (context, state) {
          final bloc = context.read<CraftsBloc>();
          return TextFormField(
            style: AppStyles.getBoldStyle(fontSize: AppFontSize.light),
            controller: bloc.searchController,
            textAlign: TextAlign.start,
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            cursorHeight: 18,
            onFieldSubmitted: (_) {
              bloc.add(SearchOnCrafts());
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onEditingComplete: () {
              bloc.add(SearchOnCrafts());
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              fillColor: Theme.of(context).listTileTheme.tileColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              hintText: getHintText(context),
            ),
          );
        },
      ),
    );
  }

  String getHintText(BuildContext context) {
    final bloc = context.read<CraftsBloc>();

    if (bloc.selectedCraftId == -1) {
      return S.of(context).search;
    } else {
      return '${S.of(context).search_on} ${bloc.selectedCraftName(context)}';
    }
  }
}
