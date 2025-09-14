import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/search_field.dart';
import '../../../../../generated/l10n.dart';
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
