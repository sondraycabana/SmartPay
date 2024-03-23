import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../constants/app_colors.dart';
// import 'package:pinput/pinput.dart';


class CreatePinInputField extends StatefulWidget {
  final void Function(String)? onCompleted;
  final int length;
  final TextEditingController pinController;
  final void Function(String)? onChanged;

  const CreatePinInputField({
    Key? key,
    this.onCompleted,
    required this.pinController,
    this.length = 4,
    this.onChanged,
  }) : super(key: key);

  @override
  CreatePinInputFieldState createState() => CreatePinInputFieldState();
}

class CreatePinInputFieldState extends State<CreatePinInputField> {
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
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );

    return
      Pinput(
      length: widget.length,
      controller: widget.pinController,
      focusNode: focusNode,
      autofocus: true,
      readOnly: true,
      obscureText: true,
      obscuringWidget: const Text(
        "•",
        style: TextStyle(fontSize: 54, height: 0),
      ),
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
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.5,
            ),
          ),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 1.5,
            ),
          ),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: null,
        ),
      ),
    );
  }
}
