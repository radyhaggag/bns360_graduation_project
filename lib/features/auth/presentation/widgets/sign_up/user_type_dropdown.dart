import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums/user_type.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../core/widgets/input_fields/input_field_with_tooltip_wrapper.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class UserTypeDropdown extends StatelessWidget {
  const UserTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        return CustomDropdown<UserType>(
          value: authBloc.userType,
          onTapCallback: (value) => authBloc.add(
            ChangeUserTypeEvent(userType: value),
          ),
          items: UserType.signUpTypes,
          viewItems:
              UserType.signUpTypes.map((e) => e.getText(context)).toList(),
          label: S.of(context).pleaseChoose,
          textValue: authBloc.userType?.getText(context),
          customChild: <Widget>(UserType value) => InputFieldWithTooltipWrapper(
            tooltip: getTooltip(value),
            inputFieldWidget: Center(
              child: Text(
                value.getText(context),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String getTooltip(UserType type) {
    switch (type) {
      case UserType.user:
        return S.current.user_tooltip;
      case UserType.businessOwner:
        return S.current.business_owner_tooltip;
      case UserType.serviceProvider:
        return S.current.craftsman_tooltip;
      default:
        return "";
    }
  }
}
