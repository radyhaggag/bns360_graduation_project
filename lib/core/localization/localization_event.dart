part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class GetSavedLanguage extends LocalizationEvent {}

class ChangeLanguage extends LocalizationEvent {
  final String languageCode;

  const ChangeLanguage(this.languageCode);
}
