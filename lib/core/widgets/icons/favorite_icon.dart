import '../../utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rounded_icon_btn.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    this.onPressed,
    this.isFavorite,
    this.useSetStateToChangeColor,
    this.addMargin = true,
    this.backgroundColor,
    this.size,
    this.notRounded = false,
  });

  final void Function()? onPressed;
  final bool? isFavorite;
  final bool? useSetStateToChangeColor;
  final bool addMargin;
  final Color? backgroundColor;
  final double? size;
  final bool notRounded;

  @override
  State<FavoriteIcon> createState() => FavoriteIconState();
}

class FavoriteIconState extends State<FavoriteIcon> {
  late bool isFavorite;
  late bool useSetStateToChangeColor;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite ?? false;
    useSetStateToChangeColor = widget.useSetStateToChangeColor ?? false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.notRounded) {
      return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : FeatherIcons.heart,
          size: widget.size,
          color: isFavorite ? Colors.red : context.theme.cardColor,
        ),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minHeight: 30.r, minWidth: 30.r),
        style: IconButton.styleFrom(
          backgroundColor: context.theme.highlightColor,
        ),
        onPressed: () {
          widget.onPressed?.call();
          if (useSetStateToChangeColor) {
            setState(() => isFavorite = !isFavorite);
          }
        },
      );
    }
    return RoundedIconBtn(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      backgroundColor: widget.backgroundColor,
      onPressed: () {
        widget.onPressed?.call();
        if (useSetStateToChangeColor) {
          setState(() => isFavorite = !isFavorite);
        }
      },
      addMargin: widget.addMargin,
    );
  }
}
