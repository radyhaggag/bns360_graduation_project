import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../utils/cache_helper.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final CacheHelper cacheHelper;

  LocalizationBloc(this.cacheHelper) : super(LocalizationInitial()) {
    on<GetSavedLanguage>(_getSavedLanguage);
    on<ChangeLanguage>(_changeLanguage);
  }

  _getSavedLanguage(GetSavedLanguage event, Emitter<LocalizationState> emit) {
    final cachedLanguageCode = cacheHelper.getCachedLanguage();
    emit(ChangeLocalState(locale: Locale(cachedLanguageCode)));
  }

  _changeLanguage(ChangeLanguage event, Emitter<LocalizationState> emit) async {
    await cacheHelper.cacheLanguage(event.languageCode);
    emit(ChangeLocalState(locale: Locale(event.languageCode)));
  }
}
