import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatelessWidget {
  final String? title;
  final String? label;
  final String? hint;
  final String? prefixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool isSecure;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final double? fontSize;
  final double? heightBetweenLabelAndField;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final int? maxLines;
  final int? maxLength;
  final Widget? separatorWidget;
  final bool isHorizontally;
  final double? textFieldWidth;
  final double? textFieldHeight;
  final bool isDigitsOnly;
  final double? fromStartMargin;
  final TextAlign? textAlign;
  const CustomInputField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.title,
    this.prefixText,
    this.initialValue,
    this.isSecure = false,
    this.keyboardType,
    this.suffixIcon,
    this.fontSize,
    this.heightBetweenLabelAndField,
    this.inputDecoration,
    this.textStyle,
    this.maxLines,
    this.isHorizontally = false,
    this.separatorWidget,
    this.textFieldWidth,
    this.isDigitsOnly = false,
    this.fromStartMargin,
    this.textAlign,
    this.textFieldHeight,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return _textField;
    } else if (isHorizontally) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title!,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.theme.cardColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
          if (separatorWidget != null) separatorWidget!,
          if (textFieldWidth != null)
            Container(
              width: textFieldWidth,
              height: textFieldHeight,
              margin: EdgeInsetsDirectional.only(start: fromStartMargin ?? 0),
              child: _textField,
            )
          else
            Expanded(child: _textField),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title!,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.theme.cardColor,
                  fontSize: fontSize,
                ),
              ),
            ),
            SizedBox(height: heightBetweenLabelAndField ?? 5),
          ],
          _textField,
        ],
      );
    }
  }

  Widget get _textField => _BuildTextField(
        controller: controller,
        validator: validator,
        initialValue: initialValue,
        isSecure: isSecure,
        keyboardType: keyboardType,
        textStyle: textStyle,
        maxLines: maxLines,
        inputDecoration: inputDecoration,
        hint: hint,
        title: title,
        label: label,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
        isDigitsOnly: isDigitsOnly,
        textAlign: textAlign,
        assignPadding: textFieldHeight != null,
        textFieldHeight: textFieldHeight,
        maxLength: maxLength,
      );
}

class _BuildTextField extends StatefulWidget {
  const _BuildTextField({
    required this.controller,
    required this.validator,
    required this.initialValue,
    required this.isSecure,
    required this.keyboardType,
    required this.textStyle,
    this.maxLines,
    this.maxLength,
    required this.inputDecoration,
    required this.hint,
    required this.title,
    required this.label,
    required this.prefixText,
    required this.suffixIcon,
    required this.isDigitsOnly,
    this.textAlign,
    this.assignPadding = false,
    this.textFieldHeight,
  });

  final TextEditingController? controller;
  final String? Function(String? p1)? validator;
  final String? initialValue;
  final bool isSecure;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final int? maxLines;
  final InputDecoration? inputDecoration;
  final String? hint;
  final String? title;
  final String? label;
  final String? prefixText;
  final Widget? suffixIcon;
  final bool isDigitsOnly;
  final TextAlign? textAlign;
  final bool assignPadding;
  final double? textFieldHeight;
  final int? maxLength;

  @override
  State<_BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<_BuildTextField> {
  String? hintText;
  String? prefixText;

  @override
  void initState() {
    super.initState();
    hintText = widget.hint;
    prefixText = widget.prefixText;
    if (hintText != null) {
      prefixText = null;
    }
    widget.controller?.addListener(() {
      String textValue = widget.controller?.text ?? "";
      if (textValue.isNotEmpty && widget.prefixText != null) {
        if (prefixText == null) {
          prefixText = widget.prefixText;
          hintText = null;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      initialValue: widget.initialValue,
      obscureText: widget.isSecure,
      keyboardType: widget.keyboardType,
      style: widget.textStyle,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onTap: () {
        String textValue = widget.controller?.text ?? "";
        if (textValue.isEmpty && widget.prefixText != null) {
          if (prefixText == null) {
            prefixText = widget.prefixText;
            hintText = null;

            setState(() {});
          }
        }
      },
      inputFormatters: widget.isDigitsOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: widget.inputDecoration ??
          InputDecoration(
            hintText: hintText,
            labelText: widget.title != null ? null : widget.label,
            prefixText: prefixText,
            suffixIcon: widget.suffixIcon,
            alignLabelWithHint: true,
            counter: const SizedBox.shrink(),
            contentPadding: widget.assignPadding
                ? EdgeInsets.symmetric(horizontal: 5.w)
                : null,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
    );
  }
}
