import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    this.onFieldSubmitted,
    this.hintText,
    this.onChanged,
    this.height,
    this.withPrefixIcon = false,
    this.textFieldColor,
  });

  final TextEditingController searchController;
  final void Function()? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? hintText;
  final double? height;
  final bool withPrefixIcon;
  final Color? textFieldColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        // vertical: 10,
      ),
      height: height ?? 30.h,
      child: TextFormField(
        style: context.textTheme.titleMedium?.copyWith(
          fontSize: AppFontSize.light,
        ),
        controller: searchController,
        textAlign: TextAlign.start,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 18,
        onFieldSubmitted: (_) {
          onFieldSubmitted?.call();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onEditingComplete: () {
          onFieldSubmitted?.call();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: textFieldColor ?? context.theme.scaffoldBackgroundColor,
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
          prefixIcon: withPrefixIcon
              ? Icon(
                  FeatherIcons.search,
                  color: context.theme.cardColor,
                )
              : null,
        ),
      ),
    );
  }
}
