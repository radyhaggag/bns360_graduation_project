import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/cache_helper.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CacheHelper cacheHelper;
  SplashBloc({
    required this.cacheHelper,
  }) : super(SplashInitial()) {
    on<CheckUserLoginStatusEvent>(_checkUseLoginStatus);
  }

  _checkUseLoginStatus(
    CheckUserLoginStatusEvent event,
    Emitter<SplashState> emit,
  ) async {
    // final token = await cacheHelper.getToken();
    final profile = AppProvider().getProfile();

    if (profile == null) emit(UserNotLoggedInState());
    if (profile != null) emit(UserLoggedInState());
  }
}
