import 'package:bns360_graduation_project/core/app/app_bloc.dart';
import 'package:bns360_graduation_project/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets/app_images.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/extensions/media_query.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();

    _initSlidingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBuilder(
            animation: _slidingAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: _slidingAnimation,
                child: SizedBox(
                  width: context.width * 0.7,
                  child: ClipOval(
                    child: Image.asset(
                      context.read<AppBloc>().state.theme == AppTheme.light
                          ? AppImages.appLogoWithWhiteBackground
                          : AppImages.appLogoWithBlackBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  void _initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: kSplashAnimationDurationWithMS),
    );
    _slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
