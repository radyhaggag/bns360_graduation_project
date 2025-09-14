import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class InputFieldWithTooltipWrapper extends StatelessWidget {
  const InputFieldWithTooltipWrapper({
    super.key,
    required this.inputFieldWidget,
    required this.tooltip,
    this.verticalPadding = 0,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
  });

  final Widget inputFieldWidget;
  final String tooltip;
  final double verticalPadding;
  final CrossAxisAlignment rowCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    if (tooltip.isEmpty) {
      return inputFieldWidget;
    }
    return Row(
      crossAxisAlignment: rowCrossAxisAlignment,
      children: [
        Expanded(child: inputFieldWidget),
        5.horizontalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: MyToolTipIcon(
            tooltip: tooltip,
          ),
        ),
      ],
    );
  }
}

class MyToolTipIcon extends StatefulWidget {
  final String tooltip;
  const MyToolTipIcon({
    super.key,
    required this.tooltip,
  });

  @override
  State<MyToolTipIcon> createState() => _MyToolTipIconState();
}

class _MyToolTipIconState extends State<MyToolTipIcon> {
  JustTheController tooltipController = JustTheController();

  @override
  void dispose() {
    tooltipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      controller: tooltipController,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(seconds: 5),
      preferredDirection: AxisDirection.up,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.tooltip,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.highlightColor,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          tooltipController.showTooltip();
        },
        child: CircleAvatar(
          radius: 10.r,
          backgroundColor: context.theme.primaryColor.withAlpha(30),
          child: Icon(
            Icons.question_mark,
            color: context.theme.primaryColor,
            size: 12.r,
          ),
        ),
      ),
    );
  }
}
