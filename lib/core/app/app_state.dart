part of 'app_bloc.dart';

class AppState extends Equatable {
  final Locale locale;
  final AppTheme theme;

  const AppState({
    required this.locale,
    required this.theme,
  });

  AppState copyWith({
    Locale? locale,
    AppTheme? theme,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [locale, theme];
}
