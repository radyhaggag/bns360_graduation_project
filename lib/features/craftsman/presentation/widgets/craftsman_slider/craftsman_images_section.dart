part of 'craftsman_slider_section.dart';

class _CraftsmanImage extends StatelessWidget {
  const _CraftsmanImage({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return MainNetworkImage(
      imageUrl: image,
      width: context.width,
      fit: BoxFit.cover,
    );
  }
}
