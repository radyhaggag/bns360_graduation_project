import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
part 'slider_dots_builder.dart';
part 'carousel_slider_builder.dart';

List<String> get _sliderImagesPath => [
      AppAssets.sliderImg1,
      AppAssets.sliderImg2,
      AppAssets.sliderImg3,
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
