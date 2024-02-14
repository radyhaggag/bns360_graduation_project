part of 'craftsman_slider_section.dart';

class _CarouselSliderBuilder extends StatelessWidget {
  const _CarouselSliderBuilder({
    this.onPageChanged,
    required this.images,
  });
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int itemIndex, int _) {
        return SizedBox(
          width: context.width,
          child: _CraftsmanImage(
            image: images[itemIndex],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        height: 225.h,
        autoPlayInterval: const Duration(seconds: 5),
        onPageChanged: onPageChanged,
      ),
    );
  }
}
