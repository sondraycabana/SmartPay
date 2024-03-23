import 'package:get/get.dart';

String? emailValidator(String? value) {
  if (!value!.isEmail) return 'Please enter a valid email';
  return null;
}

String? passwordValidator(String? value) {
  if (!_passwordIsStrong(value!)) return 'Please insert a strong password';
  return null;
}

bool _passwordIsStrong(String password) =>
    _passwordStates(password).every((element) => element == true);

bool _matchRegex({required String pattern, required String password}) =>
    RegExp(pattern).hasMatch(password);

List<bool> _passwordStates(String password) {
  return [
    _matchRegex(pattern: r'[A-Z]', password: password), // has upper case
    _matchRegex(pattern: r'[a-z]', password: password), // has lower case
    _matchRegex(pattern: r'[!@#\$&*~,.;:]', password: password), // has symbol
    _matchRegex(pattern: r'[0-9]', password: password), // has number
    _matchRegex(
        pattern: r'.{8,}', password: password), // is at least 8 chars long
  ];
}