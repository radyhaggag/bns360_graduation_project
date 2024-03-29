import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/icons/rounded_icon_btn.dart';

class SaveJobBtn extends StatefulWidget {
  const SaveJobBtn({
    super.key,
    this.isSaved,
  });

  final bool? isSaved;

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
      backgroundColor: isSaved ? AppColors.primary : null,
      size: 35.r,
      icon: Icon(
        isSaved ? FeatherIcons.bookmark : FeatherIcons.bookmark,
        color: isSaved ? AppColors.white : AppColors.primary,
      ),
      onPressed: () {
        setState(() => isSaved = !isSaved);
      },
      addMargin: true,
    );
  }
}
