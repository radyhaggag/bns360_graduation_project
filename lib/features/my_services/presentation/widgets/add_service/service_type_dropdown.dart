import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/my_services_bloc.dart';

class ServiceTypeDropdown extends StatelessWidget {
  const ServiceTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyServicesBloc, MyServicesState>(
      builder: (context, state) {
        final myServicesBloc = context.read<MyServicesBloc>();
        if(myServicesBloc.serviceCategories.isEmpty) {
          return const SizedBox.shrink();
        }
        return CustomDropdown<CraftEntity>(
          value: myServicesBloc.selectedServiceCraft,
          onTapCallback: (value) => myServicesBloc.add(
            SelectServiceCategoryEvent(serviceCategory: value),
          ),
          items: myServicesBloc.serviceCategories.map((e) => e).toList(),
          viewItems: myServicesBloc.serviceCategories
              .map(
                (e) => LocalizationHelper.getLocalizedString(
                  context,
                  ar: e.nameAR,
                  en: e.nameEN,
                ),
              )
              .toList(),
          label: S.of(context).select_service_category,
          textValue: myServicesBloc.selectedServiceCraft != null
              ? LocalizationHelper.getLocalizedString(
                  context,
                  ar: myServicesBloc.selectedServiceCraft?.nameAR ?? "",
                  en: myServicesBloc.selectedServiceCraft?.nameEN ?? "",
                )
              : S.of(context).select_service_category,
          horizontalPadding: 0,
        );
      },
    );
  }
}
