import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/providers/app_provider.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/profile_bloc.dart';

class EditProfileDataBtn extends StatelessWidget {
  const EditProfileDataBtn({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppProvider().isGuest) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ReactiveFormConsumer(
          builder: (context, form, child) {
            final formControls = form.controls;

            final email = (formControls['email']?.value ?? "") as String;
            final name = (formControls['name']?.value ?? "") as String;

            return CustomElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(EditProfileDataEvent(
                      email: email,
                      name: name,
                    ));
              },
              isLoading: state is EditProfileLoadingState,
              isDisabled: !form.valid ||
                  !isProfileDataChanged(
                    email,
                    name,
                    context: context,
                  ),
              label: S.of(context).save,
              width: 100.w,
            );
          },
        );
      },
    );
  }

  bool isProfileDataChanged(
    String email,
    String name, {
    required BuildContext context,
  }) {
    final bloc = context.read<ProfileBloc>();

    final profile = AppProvider().getProfile();
    return email != profile?.email ||
        name != profile?.name ||
        bloc.profile?.imageUrl != profile?.imageUrl ||
        bloc.isProfileImageCleared ||
        bloc.newImagePath != null;
  }
}
