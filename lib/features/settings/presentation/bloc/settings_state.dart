part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class LanguageSelectedState extends SettingsState {
  final Language language;

  const LanguageSelectedState({required this.language});

  @override
  List<Object> get props => [language];
}

class AppLanguageChangedState extends SettingsState {}
