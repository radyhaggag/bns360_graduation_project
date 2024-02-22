import 'package:flutter/material.dart';

import 'upload_file_error_widget.dart';
import 'upload_file_loading_widget.dart';

class ProgressUploadFileWidget extends StatelessWidget {
  const ProgressUploadFileWidget({
    super.key,
    required this.child,
    required this.progress,
    required this.isUploading,
    this.onPressedCancel,
    this.hasErrorUpload = false,
    this.onPressedRetry,
  });

  final Widget child;
  final double progress;
  final bool isUploading;
  final bool hasErrorUpload;
  final VoidCallback? onPressedCancel;
  final VoidCallback? onPressedRetry;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isUploading && !hasErrorUpload)
          UploadFileLoadingWidget(
            progress: progress,
            onPressedCancel: onPressedCancel,
          ),
        if (hasErrorUpload)
          UploadFileErrorWidget(
            onPressedRetry: onPressedRetry,
          ),
      ],
    );
  }
}
