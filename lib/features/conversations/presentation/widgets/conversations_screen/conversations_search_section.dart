import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/widgets/input_fields/search_field.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/conversations_bloc.dart';

class ConversationsSearchSection extends StatelessWidget {
  const ConversationsSearchSection({
    super.key,
    required this.conversationsBloc,
  });

  final ConversationsBloc conversationsBloc;

  @override
  Widget build(BuildContext context) {
    return SearchField(
      searchController: conversationsBloc.searchController,
      hintText: S.of(context).search,
      height: 50.h,
      withPrefixIcon: true,
      textFieldColor: context.theme.listTileTheme.tileColor,
    );
  }
}
