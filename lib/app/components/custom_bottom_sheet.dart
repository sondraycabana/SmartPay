import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    this.height = 350,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.linearToEaseOut,
          width: double.infinity,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }
}
