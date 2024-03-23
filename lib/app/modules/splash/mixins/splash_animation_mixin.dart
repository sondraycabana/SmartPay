import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin SplashAnimationMixin on GetSingleTickerProviderStateMixin {
  final fadeInDuration = const Duration(milliseconds: 350);
  late AnimationController opacityCtrl;
  late Animation<double> designOpacity, logoOpacity;

  void initAnimationController() {
    opacityCtrl = AnimationController(
      vsync: this,
      duration: fadeInDuration,
      reverseDuration: const Duration(milliseconds: 350),
    );
  }

  void initOpacityAnimation() {
    logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: opacityCtrl, curve: const Interval(0, 1)),
    );
    designOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: opacityCtrl, curve: const Interval(0.5, 1)),
    );
  }

  void runAnimation() async {
    initAnimationController();
    initOpacityAnimation();
    opacityCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 2800));
    opacityCtrl.reverse();
  }
}
