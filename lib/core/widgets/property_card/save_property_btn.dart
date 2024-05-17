import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../databases/local_storage/hive_manager.dart';
import '../icons/rounded_icon_btn.dart';

class SavePropertyBtn extends StatefulWidget {
  const SavePropertyBtn({
    super.key,
    required this.propertyId,
    this.notSavedColor,
    this.notSavedBackgroundColor,
    this.size,
  });

  final int propertyId;
  final Color? notSavedColor;
  final Color? notSavedBackgroundColor;
  final double? size;

  @override
  State<SavePropertyBtn> createState() => SavePropertyBtnState();
}

class SavePropertyBtnState extends State<SavePropertyBtn> {
  late bool isSaved;
  late bool useSetStateToChangeColor;

  @override
  void initState() {
    super.initState();
    isSaved = isSavedInLocal;
  }

  bool get isSavedInLocal {
    final savedProperties =
        HiveBoxes.savedProperties.get('savedProperties') ?? [];
    return savedProperties.contains(widget.propertyId);
  }

  @override
  Widget build(BuildContext context) {
    return RoundedIconBtn(
      backgroundColor: isSaved ? AppColors.primary : null,
      size: 35.r,
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
