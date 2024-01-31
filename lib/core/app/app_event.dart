part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class ChangeAppState extends AppEvent {
  final Locale? locale;
  final AppTheme? theme;

  const ChangeAppState({
    this.locale,
    this.theme,
  });
}
