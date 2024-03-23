import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ScaleAnimationMixin on GetTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> backgroundImageScale;

  final Duration _backgroundScaleDuration = const Duration(seconds: 5);

  void _initScaleController() {
    _scaleController =
        AnimationController(vsync: this, duration: _backgroundScaleDuration);
  }

  void _initScaleAnimation() {
    backgroundImageScale =
        Tween<double>(begin: 1, end: 1.1).animate(_scaleController);
  }

  void initAndStartScaleAnimation() {
    _initScaleController();
    _initScaleAnimation();
  }

  void disposeScaleController(){
    _scaleController.dispose();
  }
}
