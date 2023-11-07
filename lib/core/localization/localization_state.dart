part of 'localization_bloc.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();

  @override
  List<Object> get props => [];
}

final class LocalizationInitial extends LocalizationState {}

class ChangeLocalState extends LocalizationState {
  final Locale locale;
  const ChangeLocalState({required this.locale});
}
