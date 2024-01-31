import '../../../../../core/utils/enums.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/localization_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets/app_images.dart';

part 'chatbot_vector.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        RotatedBox(
          quarterTurns:
              LocalizationHelper.currentLanguage == Language.arabic ? 1 : 0,
          child: CustomPaint(
            size: const Size(62, 62),
            painter: _RPSCustomPainter(),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            AppImages.chatbot,
            width: 75,
            height: 75,
          ),
        ),
      ],
    );
  }
}
