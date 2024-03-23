import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/asset_paths.dart';


class BackIconButton extends StatelessWidget {
  final void Function()? onPressed;
  const BackIconButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed ?? () => Get.back(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(.14),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).backgroundColor.withOpacity(.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(
            AssetPath.backIcon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
