import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../config/routes/app_pages.dart';

mixin NextAnimationMixin on GetTickerProviderStateMixin {
  late AnimationController nextController;
  late Animation<Offset> slideDownPosition, slideUpPosition;
  late Animation<double> opacityAnimation;

  void _initNextController() {
    nextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 400),
    );
  }

  Animation<Offset> _slideAnimation(double direction) {
    return Tween<Offset>(
      begin: Offset.fromDirection(direction),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: nextController,
      curve: const Interval(0, 1, curve: Curves.easeInOutQuart),
    ));
  }

  void _initSlideAnimations() {
    slideDownPosition = _slideAnimation(pi * 1.5);
    slideUpPosition = _slideAnimation(pi * .5);
  }

  void _initOpacityAnimation() {
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: nextController,
      curve: const Interval(.75, 1),
    ));
  }

  void initNextAnimation() {
    _initNextController();
    _initSlideAnimations();
    _initOpacityAnimation();
    nextController.value = nextController.upperBound;
  }

  Future<void> animateMovingToNextPage() async {
    nextController.reverse(from: nextController.upperBound);
    await Future.delayed(const Duration(milliseconds: 200));
    nextController.forward(from: nextController.lowerBound);
  }

  void disposeNextController() {
    nextController.dispose();
  }

  void navigateToSignIn() {
    Get.offAndToNamed(Routes.signIn);
  }
}
