import 'package:flutter/material.dart';

import 'messages/empty_message_widget.dart';

class MainListViewBuilder<T> extends StatelessWidget {
  final List<T> list;
  final Widget Function(T) itemWidget;
  final String? emptyMessage;
  final Axis scrollDirection;
  final double width;
  final double height;
  const MainListViewBuilder({
    super.key,
    required this.list,
    this.emptyMessage,
    required this.itemWidget,
    required this.scrollDirection,
    required this.width,
    required this.height,
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
          scrollDirection: scrollDirection,
          itemBuilder: (_, index) {
            return itemWidget(list[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: list.length,
        ),
      );
    }
  }
}
