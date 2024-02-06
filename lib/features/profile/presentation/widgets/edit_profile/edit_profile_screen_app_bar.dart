import 'package:bns360_graduation_project/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

// class EditProfileScreenAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   const EditProfileScreenAppBar({super.key, this.imageUrl});

//   final String? imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(10),
//           bottomRight: Radius.circular(10),
//         ),
//       ),
//       leading: const CustomBackButton(
//         color: Colors.white,
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(60);
// }
class EditProfileScreenAppBar extends StatelessWidget {
  const EditProfileScreenAppBar({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      leading: CustomBackButton(
        color: Colors.white,
      ),
    );
  }
}
