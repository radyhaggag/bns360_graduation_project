import 'package:flutter/material.dart';

import 'messages/empty_message_widget.dart';

class MainListViewBuilder<T> extends StatelessWidget {
  final List<T> list;
  final Widget Function(T, int) itemWidget;
  final String? emptyMessage;
  final Axis scrollDirection;
  final double? width;
  final double? height;
  final double? separatingSpace;
  final ScrollController? scrollController;

  const MainListViewBuilder({
    super.key,
    required this.list,
    this.emptyMessage,
    required this.itemWidget,
    required this.scrollDirection,
    this.width,
    this.height,
    this.separatingSpace,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty && emptyMessage == null) {
      return const SizedBox.shrink();
    } else if (list.isEmpty && emptyMessage != null) {
      return EmptyMessageWidget(message: emptyMessage!);
    } else {
      return SizedBox(
        width: width,
        height: height,
        child: ListView.separated(
          controller: scrollController,
          scrollDirection: scrollDirection,
          itemBuilder: (_, index) {
            return itemWidget(list[index], index);
          },
          separatorBuilder: (_, __) => SizedBox(width: separatingSpace ?? 10),
          itemCount: list.length,
        ),
      );
    }
  }
}
