import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app_bloc.dart';
import '../enums.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  Brightness get brightness {
    final appTheme = read<AppBloc>().state.theme;

    return appTheme == AppTheme.light ? Brightness.light : Brightness.dark;
  }
}
