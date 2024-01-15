part of 'home_slider_section.dart';

class _CarouselSliderBuilder extends StatelessWidget {
  const _CarouselSliderBuilder({
    this.onPageChanged,
  });
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int _) {
        return SizedBox(
          width: context.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              _sliderImagesPath[itemIndex],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 130.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: .80,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
