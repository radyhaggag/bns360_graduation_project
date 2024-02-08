import 'package:flutter/material.dart';

import 'rounded_icon_btn.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    this.onPressed,
    this.isFavorite,
    this.useSetStateToChangeColor,
    this.addMargin = true,
  });

  final void Function()? onPressed;
  final bool? isFavorite;
  final bool? useSetStateToChangeColor;
  final bool addMargin;

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
    return RoundedIconBtn(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
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
