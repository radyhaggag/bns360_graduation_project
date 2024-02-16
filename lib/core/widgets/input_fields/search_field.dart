import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    required this.onFieldSubmitted,
    required this.hintText,
  });

  final TextEditingController searchController;
  final void Function() onFieldSubmitted;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        // vertical: 10,
      ),
      height: 30.h,
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: AppFontSize.light,
            ),
        controller: searchController,
        textAlign: TextAlign.start,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 18,
        onFieldSubmitted: (_) {
          onFieldSubmitted.call();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onEditingComplete: () {
          onFieldSubmitted.call();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          fillColor: Theme.of(context).listTileTheme.tileColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
