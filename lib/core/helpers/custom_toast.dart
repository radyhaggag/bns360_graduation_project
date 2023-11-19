import 'package:bns360_graduation_project/core/utils/app_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';

enum ToastType { success, error }

void showToast(String message, ToastType type) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor:
          type == ToastType.success ? AppColors.success : AppColors.red,
      textColor: AppColors.white,
      fontSize: AppFontSize.body,
    );
