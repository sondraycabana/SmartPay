import 'package:flutter/material.dart';

class HeadlineTitleText extends StatelessWidget {
  const HeadlineTitleText({
    Key? key,
    this.primaryText,
    this.accentText,
    this.subPrimaryText,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String? primaryText, accentText, subPrimaryText;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: primaryText,
        style: TextStyle(
          height: 1.35,
          fontSize: 25,
          letterSpacing: -1,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).primaryColor,
        ),
        children: <TextSpan>[
          TextSpan(
            text: accentText,
            style: TextStyle(
              height: 1.35,
              fontSize: 25,
              letterSpacing: -1,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          TextSpan(
            text: subPrimaryText,
            style: TextStyle(
              height: 1.35,
              letterSpacing: -1,
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
