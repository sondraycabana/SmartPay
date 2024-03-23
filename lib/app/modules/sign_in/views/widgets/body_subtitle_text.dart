import 'package:flutter/material.dart';

class BodySubTitleText extends StatelessWidget {
  const BodySubTitleText({
    Key? key,
    this.primaryText,
    this.accentText,
    this.subPrimaryText,
    this.boldText,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String? primaryText, accentText, boldText, subPrimaryText;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        bottom: 32.0,
      ),
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          text: primaryText,
          style: TextStyle(
            height: 1.5,
            fontSize: 16,
            letterSpacing: -.4,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).hintColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: accentText,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
                letterSpacing: -.4,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            TextSpan(
              text: boldText,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
                letterSpacing: -.4,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
            TextSpan(
              text: subPrimaryText,
              style: TextStyle(
                height: 1.5,
                letterSpacing: -.4,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
