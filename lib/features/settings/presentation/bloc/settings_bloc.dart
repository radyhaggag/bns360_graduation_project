import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/locale.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/enums.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final CacheHelper cacheHelper;
  SettingsBloc({
    required this.cacheHelper,
  }) : super(SettingsInitial()) {
    _selectedLanguage = cacheHelper.getCachedLanguage().language;
    on<SelectLanguageToChangeEvent>(_selectLanguageToChange);
    on<ChangeAppLanguageEvent>(_changeAppLanguage);
  }

  Language? _selectedLanguage;
  Language? get selectedLanguage => _selectedLanguage;
  Language? get cachedLanguage => cacheHelper.getCachedLanguage().language;

  ValueNotifier<bool> isLanguageChanged = ValueNotifier(false);

  _selectLanguageToChange(
    SelectLanguageToChangeEvent event,
    Emitter<SettingsState> emit,
  ) {
    _selectedLanguage = event.language;
    if (_selectedLanguage == cachedLanguage) {
      isLanguageChanged.value = false;
    } else {
      isLanguageChanged.value = true;
    }
    emit(LanguageSelectedState(language: _selectedLanguage!));
  }

  _changeAppLanguage(
    ChangeAppLanguageEvent event,
    Emitter<SettingsState> emit,
  ) {
    if (selectedLanguage == null) return;
    emit(AppLanguageChangedState());
    isLanguageChanged.value = false;
  }
}
