import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static saveToken(String tokenValue) {
    return GetStorage().write("token", tokenValue);
  }

  static getToken() {
    return GetStorage().read("token");
  }

  static deleteToken() {
    return GetStorage().remove("token");
  }

  static savePINCode(String pinCodeValue) {
    return GetStorage().write("pinCode", pinCodeValue);
  }

  static getPINCode() {
    return GetStorage().read("pinCode");
  }

  static saveFullName(String fullNameValue) {
    return GetStorage().write("fullName", fullNameValue);
  }

  static getFullName() {
    return GetStorage().read("fullName");
  }

  static saveUserEmail(String userEmailValue) {
    return GetStorage().write("userEmail", userEmailValue);
  }

  static getUserEmail() {
    return GetStorage().read("userEmail");
  }

  static saveVerifyCode(String verifyCodeValue) {
    return GetStorage().write("verifyCode", verifyCodeValue);
  }

  static getVerifyCode() {
    return GetStorage().read("verifyCode");
  }
}
