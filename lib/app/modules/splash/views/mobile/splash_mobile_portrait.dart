import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/asset_paths.dart';
import '../../controllers/splash_controller.dart';
import '../widgets/asset_fade_in_image.dart';

class SplashMobilePortrait extends GetView<SplashController> {
  final _controller = Get.find<SplashController>();

  SplashMobilePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetFadeInImage(
                  opacity: controller.logoOpacity,
                  width: width * .18,
                  image: AssetPath.smartPayLogo,
                  fadeInDuration: _controller.fadeInDuration,
                ),
                FadeTransition(
                  opacity: controller.logoOpacity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Smart",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "pay.",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
