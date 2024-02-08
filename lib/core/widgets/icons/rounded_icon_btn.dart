import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    this.onPressed,
    required this.icon,
    this.addMargin = false,
  });

  final void Function()? onPressed;
  final Widget icon;
  final bool addMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: addMargin
          ? const EdgeInsets.symmetric(horizontal: 5, vertical: 2)
          : EdgeInsets.zero,
      child: IconButton(
        onPressed: () => onPressed?.call(),
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).hintColor.withOpacity(.05),
          padding: EdgeInsets.zero,
        ),
        icon: icon,
      ),
    );
  }
}
