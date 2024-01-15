import 'package:flutter/material.dart';

import 'center_progress_indicator.dart';
import 'messages/error_message_widget.dart';

class DataStateWidget extends StatelessWidget {
  final bool isLoading;
  final Widget? loadingWidget;
  final bool isError;
  final String errorMessage;
  final bool isLoaded;
  final Widget loadedWidget;

  const DataStateWidget({
    super.key,
    required this.isLoading,
    this.loadingWidget,
    required this.isError,
    required this.errorMessage,
    required this.isLoaded,
    required this.loadedWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CenterProgressIndicator();
    } else if (isError) {
      return ErrorMessageWidget(message: errorMessage);
    } else {
      return loadedWidget;
    }
  }
}
