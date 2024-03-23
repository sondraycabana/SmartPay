import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/enter_pin_controller.dart';

class EnterPinNumberGrid extends GetView<EnterPinController> {
  const EnterPinNumberGrid(
      {Key? key,
      this.color = Colors.white,
      this.aspectRatio = 1.85,
      this.fontSize})
      : super(key: key);

  final Color color;
  final double aspectRatio;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: aspectRatio,
        children: List.generate(
          12,
          (index) => TextButton(
            onPressed: () => controller.buttonFunction(index),
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(
              controller.buttonText(index),
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                    fontSize: fontSize,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
