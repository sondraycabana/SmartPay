import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/asset_paths.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
    this.isBottomSheetField = false,
    this.isSearchField = false,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.name,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField, isBottomSheetField, isSearchField, readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: widget.isPasswordField ? _obscureText : false,
      onChanged: widget.onChanged,
      style: TextStyle(
        height: 1.35,
        fontSize: 16,
        letterSpacing: .1,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).primaryColor.withOpacity(.04),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          height: 1.35,
          fontSize: 16,
          letterSpacing: .2,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).hintColor.withOpacity(
                widget.isSearchField ? .85 : .65,
              ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).indicatorColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        suffixIcon: widget.isPasswordField
            ? PasswordSuffixWidget(
                obscureText: _obscureText,
                onPressed: _toggle,
              )
            : widget.isBottomSheetField
                ? const ChevronDownIconWidget()
                : null,
        prefixIcon: widget.isSearchField ? const SearchIconWidget() : null,
      ),
    );
  }

  void _toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }
}

class PasswordSuffixWidget extends StatelessWidget {
  const PasswordSuffixWidget({
    Key? key,
    required this.onPressed,
    required this.obscureText,
  }) : super(key: key);

  final void Function() onPressed;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        width: 32,
        height: 24,
        child: Center(
          child: FaIcon(
            obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            size: 18,
            color: Theme.of(context).hintColor.withOpacity(.75),
          ),
        ),
      ),
    );
  }
}

class ChevronDownIconWidget extends StatelessWidget {
  const ChevronDownIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 32,
      height: 24,
      child: Center(
        child: SvgPicture.asset(
          AssetPath.chevronDown,
          height: 20,
          color: Theme.of(context).hintColor.withOpacity(.75),
        ),
      ),
    );
  }
}

class SearchIconWidget extends StatelessWidget {
  const SearchIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 32,
      height: 24,
      child: Center(
        child: SvgPicture.asset(
          AssetPath.searchIcon,
          height: 24,
          color: Theme.of(context).hintColor.withOpacity(1),
        ),
      ),
    );
  }
}
