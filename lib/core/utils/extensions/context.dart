import 'package:bns360_graduation_project/core/app/app_bloc.dart';
import 'package:bns360_graduation_project/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  Brightness get brightness {
    final appTheme = read<AppBloc>().state.theme;

    return appTheme == AppTheme.light ? Brightness.light : Brightness.dark;
  }
}
