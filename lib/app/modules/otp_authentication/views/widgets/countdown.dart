import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  const Countdown({
    super.key,
    required this.animation,
    required this.onPressed,
  }) : super(
          listenable: animation,
        );
  final Animation<int> animation;
  final void Function() onPressed;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        clockTimer.inSeconds.remainder(120).toString().padLeft(2, '0');
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            timerText == '00' ? 'Didn’t get the mail?  ' : 'Resend Code  ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor.withOpacity(.65),
            ),
            textAlign: TextAlign.center,
          ),
          timerText == '00'
              ? InkWell(
                  onTap: onPressed,
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondary,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      timerText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor.withOpacity(.65),
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ' secs',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor.withOpacity(.65),
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
