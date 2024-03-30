part of 'custom_slider.dart';

class _ImagesSection extends StatelessWidget {
  const _ImagesSection({
    required this.image,
    this.imagesRadius,
  });

  final String image;
  final double? imagesRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: imagesRadius != null ? 5 : 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imagesRadius ?? 0),
        child: MainNetworkImage(
          imageUrl: image,
          width: context.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
