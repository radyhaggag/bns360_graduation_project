import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets/app_images.dart';
import '../../../../../core/utils/extensions/media_query.dart';

part 'carousel_slider_builder.dart';
part 'slider_dots_builder.dart';

List<String> get _sliderImagesPath => [
      AppImages.sliderImg1,
      AppImages.sliderImg2,
      AppImages.sliderImg3,
    ];

class HomeSliderSection extends StatefulWidget {
  const HomeSliderSection({super.key});

  @override
  State<HomeSliderSection> createState() => _HomeSliderSectionState();
}

class _HomeSliderSectionState extends State<HomeSliderSection> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CarouselSliderBuilder(
          onPageChanged: (index, reason) {
            setState(() => activeIndex = index);
          },
        ),
        const SizedBox(height: 25),
        _SliderDotsBuilder(
          length: _sliderImagesPath.length,
          activeIndex: activeIndex,
        ),
      ],
    );
  }
}
