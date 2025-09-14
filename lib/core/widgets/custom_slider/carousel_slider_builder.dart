part of 'custom_slider.dart';

class _CarouselSliderBuilder extends StatelessWidget {
  const _CarouselSliderBuilder({
    this.onPageChanged,
    required this.images,
    this.height,
    this.imagesRadius,
  });
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final List<String> images;
  final double? height;
  final double? imagesRadius;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    if (images.length == 1) {
      return SizedBox(
        height: height ?? 225.h,
        child: _ImagesSection(
          image: images.first,
          imagesRadius: imagesRadius,
        ),
      );
    }

    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int itemIndex, int _) {
        return SizedBox(
          width: context.width,
          child: _ImagesSection(
            image: images[itemIndex],
            imagesRadius: imagesRadius,
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        height: height ?? 225.h,
        autoPlayInterval: const Duration(seconds: 5),
        onPageChanged: onPageChanged,
      ),
    );
  }
}
