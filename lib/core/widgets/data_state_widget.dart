import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/media_query.dart';
import 'center_progress_indicator.dart';
import 'messages/error_message_widget.dart';

class DataStateWidget extends StatelessWidget {
  final bool isLoading;
  final Widget? loadingWidget;
  final bool isError;
  final String? errorMessage;
  final bool isLoaded;
  final Widget? loadedWidget;
  final Color? errorMsgBackground;

  const DataStateWidget({
    super.key,
    required this.isLoading,
    this.loadingWidget,
    required this.isError,
    this.errorMessage,
    required this.isLoaded,
    this.loadedWidget,
    this.errorMsgBackground,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ??
          SizedBox(
            width: context.width,
            height: 150.r,
            child: CenterProgressIndicator(
              color: Theme.of(context).indicatorColor,
            ),
          );
    } else if (isError) {
      return ErrorMessageWidget(
        message: errorMessage ?? "",
        backgroundColor: errorMsgBackground,
      );
    } else {
      return loadedWidget!;
    }
  }
}
