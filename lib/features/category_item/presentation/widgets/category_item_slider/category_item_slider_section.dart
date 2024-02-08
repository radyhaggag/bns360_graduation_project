import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/media_query.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/main_network_image.dart';

part 'carousel_slider_builder.dart';
part 'slider_rect_builder.dart';
part 'category_item_images_section.dart';

class CategoryItemSliderSection extends StatefulWidget {
  const CategoryItemSliderSection({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<CategoryItemSliderSection> createState() =>
      _CategoryItemSliderSectionState();
}

class _CategoryItemSliderSectionState extends State<CategoryItemSliderSection> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _CarouselSliderBuilder(
          onPageChanged: (index, reason) {
            setState(() => activeIndex = index);
          },
          images: widget.images,
        ),
        _SliderRectBuilder(
          length: widget.images.length,
          activeIndex: activeIndex,
        ),
      ],
    );
  }
}
