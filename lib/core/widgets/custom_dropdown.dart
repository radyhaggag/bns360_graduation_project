import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

typedef CustomOnTapCallback = Function(dynamic value);

class CustomDropdown<T> extends StatefulWidget {
  final T? value;
  final String? textValue;
  final List<T> items;
  final List<String> viewItems;
  final CustomOnTapCallback onTapCallback;
  final String label;
  final Color? dropdownColor;
  final Color? selectedItemColor;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.onTapCallback,
    required this.items,
    required this.viewItems,
    required this.label,
    this.dropdownColor,
    this.selectedItemColor,
    this.textValue,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    final dropdownColor =
        context.theme.dropdownMenuTheme.inputDecorationTheme?.fillColor;

    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: widget.dropdownColor ?? dropdownColor,
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton2<dynamic>(
        isExpanded: true,
        onMenuStateChange: (state) => setState(() => isOpened = state),
        underline: const SizedBox(),
        value: widget.value,
        hint: Text(widget.label),
        onChanged: (dynamic value) => widget.onTapCallback(value),
        items: List.generate(
          widget.items.length,
          (index) => DropdownMenuItem<T>(
            value: widget.items[index],
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: widget.items[index] == widget.value
                    ? context.theme.primaryColor.withOpacity(.25)
                    : context.theme.highlightColor,
                border: Border.all(color: context.theme.cardColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.viewItems[index],
                style: context.textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        customButton: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.textValue ?? widget.label,
                style: context.textTheme.bodyLarge,
              ),
              Icon(
                isOpened
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                size: 25,
                color: context.theme.primaryColor,
              )
            ],
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(height: 60),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.black25),
            color: widget.dropdownColor ?? context.theme.highlightColor,
          ),
          elevation: 2,
        ),
      ),
    );
  }
}
