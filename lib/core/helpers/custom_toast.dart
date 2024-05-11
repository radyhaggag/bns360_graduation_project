import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

enum ToastType { success, error }

void showToast(String message, ToastType type) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor:
          type == ToastType.success ? AppColors.green : AppColors.red,
      textColor: AppColors.white,
      fontSize: AppFontSize.body,
    );

