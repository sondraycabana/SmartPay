import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// fades in the asset image provided with [duration]
class AssetFadeInImage extends StatelessWidget {
  final double width;
  final double? height;
  final String image;
  final Duration fadeInDuration;
  final Animation<double> opacity;

  const AssetFadeInImage(
      {super.key,
      required this.width,
      this.height,
      required this.image,
      this.fadeInDuration = const Duration(milliseconds: 350),
      required this.opacity});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FadeTransition(
          opacity: opacity,
          child: SvgPicture.asset(
            image,
            width: width.toDouble(),
            height: height?.toDouble(),

          ),
        ),
      ),
    );
  }
}
