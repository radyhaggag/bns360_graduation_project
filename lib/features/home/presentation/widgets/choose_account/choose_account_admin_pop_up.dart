import 'package:bns360_graduation_project/core/shared_data/entities/participant_entity.dart';
import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/bloc/my_business_bloc.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/widgets/choose_account/choose_business_account_pop_up.dart';
import 'package:bns360_graduation_project/features/my_services/presentation/widgets/choose_account/choose_craftsman_pop_up.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/injector_container.dart';
import '../../../../my_services/presentation/bloc/my_services_bloc.dart';

class ChooseAdminAccountPopUp extends StatefulWidget {
  const ChooseAdminAccountPopUp({
    super.key,
    required this.onSelectCategory,
    required this.onSelectCraftsman,
  });

  final Function(ParticipantEntity item) onSelectCraftsman;
  final Function(ParticipantEntity item) onSelectCategory;

  static Future<void> showPopup({
    required BuildContext context,
    required Function(ParticipantEntity item) onSelectCraftsman,
    required Function(ParticipantEntity item) onSelectCategory,
  }) {
    return showDialog(
      context: context,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<MyBusinessBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<MyServicesBloc>(),
          ),
        ],
        child: AlertDialog(
          backgroundColor: context.theme.highlightColor,
          contentPadding: EdgeInsets.zero,
          content: ChooseAdminAccountPopUp(
            onSelectCategory: onSelectCategory,
            onSelectCraftsman: onSelectCraftsman,
          ),
        ),
      ),
    );
  }

  @override
  State<ChooseAdminAccountPopUp> createState() =>
      _ChooseAdminAccountPopUpState();
}

class _ChooseAdminAccountPopUpState extends State<ChooseAdminAccountPopUp> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    context.read<MyBusinessBloc>().add(GetMyBusinessEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.6,
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Text(
              S.of(context).select_account_to_processed,
              style: context.textTheme.titleSmall?.copyWith(
                fontSize: AppFontSize.details,
              ),
            ),
            SizedBox(height: 10.h),
            TabBar(
              dividerColor: Colors.transparent,
              // padding: const EdgeInsets.only(top: 8),
              indicatorColor: AppColors.primary,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                color: context.theme.cardColor,
                fontSize: AppFontSize.details,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                color: context.theme.primaryColor.withOpacity(.38),
                fontSize: AppFontSize.details,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Tab(text: S.of(context).my_business),
                Tab(text: S.of(context).my_services),
              ],
              onTap: (index) {
                this.index = index;
                setState(() {});

                if (index == 0) {
                  context.read<MyBusinessBloc>().add(GetMyBusinessEvent());
                } else {
                  context.read<MyServicesBloc>().add(GetMyServicesEvent());
                }
              },
            ),
            if (index == 0)
              Expanded(
                child: ChooseBusinessAccountBody(
                  onSelectCategoryItem: widget.onSelectCategory,
                  viewText: false,
                ),
              ),
            if (index == 1)
              Expanded(
                child: ChooseCraftsmanAccountBody(
                  onSelect: widget.onSelectCraftsman,
                  viewText: false,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
