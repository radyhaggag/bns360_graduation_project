import 'package:flutter/material.dart';

class CategoryFavoriteButton extends StatefulWidget {
  const CategoryFavoriteButton({
    super.key,
    this.onPressed,
    this.isFavorite,
    this.useSetStateToChangeColor,
  });

  final void Function()? onPressed;
  final bool? isFavorite;
  final bool? useSetStateToChangeColor;

  @override
  State<CategoryFavoriteButton> createState() => CategoryFavoriteButtonState();
}

class CategoryFavoriteButtonState extends State<CategoryFavoriteButton> {
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: IconButton(
        onPressed: () {
          widget.onPressed?.call();
          if (useSetStateToChangeColor) {
            setState(() => isFavorite = !isFavorite);
          }
        },
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).hintColor.withOpacity(.05),
          padding: EdgeInsets.zero,
        ),
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
      ),
    );
  }
}
