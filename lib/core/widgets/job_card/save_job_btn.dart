import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../icons/rounded_icon_btn.dart';

class SaveJobBtn extends StatefulWidget {
  const SaveJobBtn({
    super.key,
    this.isSaved,
    this.notSavedColor,
    this.notSavedBackgroundColor,
    this.size,
  });

  final bool? isSaved;
  final Color? notSavedColor;
  final Color? notSavedBackgroundColor;
  final double? size;

  @override
  State<SaveJobBtn> createState() => SaveJobBtnState();
}

class SaveJobBtnState extends State<SaveJobBtn> {
  late bool isSaved;
  late bool useSetStateToChangeColor;

  @override
  void initState() {
    super.initState();
    isSaved = widget.isSaved ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedIconBtn(
      backgroundColor:
          isSaved ? AppColors.primary : widget.notSavedBackgroundColor,
      size: widget.size ?? 35.r,
      icon: Icon(
        isSaved ? Icons.bookmark : FeatherIcons.bookmark,
        color: isSaved ? Colors.amber : notSavedColor,
      ),
      onPressed: () {
        setState(() => isSaved = !isSaved);
      },
      addMargin: true,
    );
  }

  Color get notSavedColor {
    return widget.notSavedColor ?? AppColors.primary;
  }
}
