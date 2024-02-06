part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SelectLanguageToChangeEvent extends SettingsEvent {
  final Language language;

  const SelectLanguageToChangeEvent({required this.language});

  @override
  List<Object> get props => [language];
}

class ChangeAppLanguageEvent extends SettingsEvent {}
