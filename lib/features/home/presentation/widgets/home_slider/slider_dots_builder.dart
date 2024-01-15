part of 'home_slider_section.dart';

class _SliderDotsBuilder extends StatelessWidget {
  const _SliderDotsBuilder({
    required this.length,
    required this.activeIndex,
  });

  final int length;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => _DotWidget(
          color: index == activeIndex ? AppColors.primary : AppColors.light,
        ),
      ),
    );
  }
}

class _DotWidget extends StatelessWidget {
  const _DotWidget({
    required this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
