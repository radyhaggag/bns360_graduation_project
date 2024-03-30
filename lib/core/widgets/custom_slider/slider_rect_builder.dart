part of 'custom_slider.dart';

class _SliderRectBuilder extends StatelessWidget {
  const _SliderRectBuilder({
    required this.length,
    required this.activeIndex,
  });

  final int length;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => _RectWidget(
            color: index == activeIndex ? AppColors.white : AppColors.light,
          ),
        ),
      ),
    );
  }
}

class _RectWidget extends StatelessWidget {
  const _RectWidget({
    required this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 5,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
