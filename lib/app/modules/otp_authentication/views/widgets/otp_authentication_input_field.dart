import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../constants/app_colors.dart';
// import 'package:pinput/pinput.dart';


class OTPAuthenticationInputField extends StatefulWidget {
  final void Function(String)? onCompleted;
  final int length;
  final TextEditingController pinController;
  final void Function(String)? onChanged;

  const OTPAuthenticationInputField({
    Key? key,
    this.onCompleted,
    required this.pinController,
    this.length = 4,
    this.onChanged,
  }) : super(key: key);

  @override
  OTPAuthenticationInputFieldState createState() => OTPAuthenticationInputFieldState();

  @override
  String toStringShort() => 'Rounded With Cursor';
}

class OTPAuthenticationInputFieldState extends State<OTPAuthenticationInputField> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color focusedBorderColor = AppColors.primaryColor;

    final defaultPinTheme = PinTheme(

      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 24,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor.withOpacity(.04),
        border: null,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );


    return Pinput(

      length: widget.length,
      controller: widget.pinController,
      focusNode: focusNode,
      autofocus: true,
      readOnly: true,
      onChanged: widget.onChanged,
      showCursor: false,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      defaultPinTheme: defaultPinTheme,
      validator: (value) {
        return null;
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: widget.onCompleted,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).indicatorColor, width: 1),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(12),
          border: null,
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(12),
          border: null,
        ),
      ),
    );
  }
}
