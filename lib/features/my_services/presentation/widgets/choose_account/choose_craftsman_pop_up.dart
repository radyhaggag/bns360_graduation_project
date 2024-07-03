import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/participant_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/models/participant_model.dart';
import 'package:bns360_graduation_project/core/utils/enums/user_type.dart';
import 'package:bns360_graduation_project/core/widgets/continue_with_personal_account.dart';
import 'package:bns360_graduation_project/core/widgets/empty_card.dart';
import 'package:bns360_graduation_project/features/my_services/presentation/bloc/my_services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/injector_container.dart';
import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/account_tile.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../generated/l10n.dart';

class ChooseCraftsmanAccountBody extends StatelessWidget {
  const ChooseCraftsmanAccountBody({
    super.key,
    required this.onSelect,
    this.viewText = true,
  });
  final Function(ParticipantEntity item) onSelect;
  final bool viewText;

  static Future<void> showPopup({
    required BuildContext context,
    required Function(ParticipantEntity item) onSelect,
  }) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider(
        create: (context) => sl<MyServicesBloc>()
          ..add(
            GetMyServicesEvent(),
          ),
        child: AlertDialog(
          backgroundColor: context.theme.highlightColor,
          contentPadding: EdgeInsets.zero,
          content: ChooseCraftsmanAccountBody(
            onSelect: onSelect,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.6,
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        top: 10.h,
      ),
      decoration: BoxDecoration(
        color: context.theme.highlightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          if (viewText) ...[
            Text(
              S.of(context).select_account_to_processed,
              style: context.textTheme.titleSmall?.copyWith(
                fontSize: AppFontSize.details,
              ),
            ),
            SizedBox(height: 10.h),
          ],
          Expanded(
            child: BlocBuilder<MyServicesBloc, MyServicesState>(
              builder: (context, state) {
                final myServices =
                    context.read<MyServicesBloc>().myServicesItems;

                return DataStateWidget(
                  isLoaded: state is GetMyServicesSuccessState,
                  isError: state is GetMyServicesErrorState,
                  isLoading: state is GetMyServicesLoadingState,
                  loadedWidget: MainListViewBuilder(
                    list: myServices,
                    emptyWidget: EmptyCard(
                      title: S.of(context).no_services_found,
                    ),
                    itemWidget: (item, index) {
                      return InkWell(
                        onTap: () {
                          final currentParticipant = ParticipantEntity(
                            id: item.id.toString(),
                            userType: UserType.serviceProvider.id,
                            imageUrl: item.profileImageUrl,
                            nameAR: item.nameAR,
                            nameEN: item.nameEN,
                          );
                          onSelect.call(currentParticipant);
                        },
                        child: AccountTile(
                          imageUrl: item.profileImageUrl,
                          accountName: LocalizationHelper.getLocalizedString(
                            context,
                            ar: item.nameAR,
                            en: item.nameEN,
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                );
              },
            ),
          ),
          ContinueWithPersonalAccount(
            onPressed: () {
              final participant = AppProvider().getProfile()!.toParticipant();
              onSelect.call(participant);
            },
          ),
        ],
      ),
    );
  }
}
