import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/media_query.dart';
import '../../../../core/widgets/icons/main_search_icon.dart';
import '../../../../generated/l10n.dart';
import '../../../crafts/presentation/widgets/crafts_search_field.dart';
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
            color: Theme.of(context).appBarTheme.backgroundColor,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 60,
          margin: const EdgeInsets.only(top: 36),
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
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Expanded(
                        child: CraftsSearchField(),
                      ),
                    ],
                  ),
                  secondChild: Text(
                    S.of(context).craftsmen,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
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
}
