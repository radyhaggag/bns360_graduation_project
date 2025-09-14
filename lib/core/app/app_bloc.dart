import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/cache_helper.dart';
import '../utils/enums.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CacheHelper cacheHelper;

  AppBloc(this.cacheHelper)
      : super(AppState(
          locale: cacheHelper.getCachedLanguage(),
          theme: cacheHelper.getTheme(),
        )) {
    on<ChangeAppState>(_changeAppState);
  }

  Future<void> _changeAppState(ChangeAppState event, Emitter<AppState> emit) async {
    if (event.locale != null && event.locale != state.locale) {
      await cacheHelper.cacheLanguage(event.locale!);
    }
    if (event.theme != null && event.theme != state.theme) {
      await cacheHelper.cacheTheme(event.theme!);
    }
    emit(state.copyWith(
      locale: event.locale,
      theme: event.theme,
    ));
  }
}
