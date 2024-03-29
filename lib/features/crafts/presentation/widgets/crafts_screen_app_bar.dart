import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/icons/main_search_icon.dart';
import '../../../../core/widgets/input_fields/search_field.dart';
import '../../../../generated/l10n.dart';
import '../bloc/crafts_bloc.dart';

class CraftsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CraftsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CraftsBloc, CraftsState>(
      buildWhen: (previous, current) {
        return current is SearchIconToggled;
      },
      builder: (context, state) {
        final bloc = context.read<CraftsBloc>();
        return Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: context.theme.appBarTheme.backgroundColor,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 60,
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: AnimatedCrossFade(
                  firstChild: Row(
                    children: [
                      InkWell(
                        onTap: () => bloc.add(ToggleSearchIcon()),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: SearchField(
                          searchController: bloc.searchController,
                          onFieldSubmitted: () {
                            bloc.add(SearchOnCrafts());
                          },
                          hintText: getHintText(context),
                        ),
                      ),
                    ],
                  ),
                  secondChild: Text(
                    S.of(context).craftsmen,
                    style: context.theme.appBarTheme.titleTextStyle,
                  ),
                  crossFadeState: bloc.isSearchEnabled
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 150),
                ),
              ),
              MainSearchIcon(
                horizontalPadding: 0.0,
                onTap: () {
                  if (!bloc.isSearchEnabled) {
                    bloc.add(ToggleSearchIcon());
                  } else {
                    bloc.add(SearchOnCrafts());
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  String getHintText(BuildContext context) {
    final bloc = context.read<CraftsBloc>();

    if (bloc.selectedCraftId == -1) {
      return S.of(context).search;
    } else {
      return '${S.of(context).search_on} ${bloc.selectedCraftName(context)}';
    }
  }
}
