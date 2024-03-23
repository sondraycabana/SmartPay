import 'package:flutter/material.dart';

class SizeEntryAnimation extends StatefulWidget {
  const SizeEntryAnimation({required this.child, this.duration, Key? key})
      : super(key: key);

  final Widget child;
  final Duration? duration;

  @override
  _SizeEntryAnimationState createState() => _SizeEntryAnimationState();
}

class _SizeEntryAnimationState extends State<SizeEntryAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeFactor;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? Duration(milliseconds: 400),
    );

    sizeFactor = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: sizeFactor,
      child: widget.child,
    );
  }
}
