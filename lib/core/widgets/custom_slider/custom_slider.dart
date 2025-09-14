import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/main_network_image.dart';

part '_images_section.dart';
part 'carousel_slider_builder.dart';
part 'slider_rect_builder.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
    required this.images,
    this.height,
    this.imagesRadius,
    this.viewPaginationBars = true,
  });

  final List<String> images;
  final double? height;
  final bool viewPaginationBars;
  final double? imagesRadius;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
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
          height: widget.height,
          imagesRadius: widget.imagesRadius,
        ),
        if (widget.viewPaginationBars && widget.images.length > 1)
          _SliderRectBuilder(
            length: widget.images.length,
            activeIndex: activeIndex,
          ),
      ],
    );
  }
}
