import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../components/custom_snack_bar.dart';
import '../../../config/routes/app_pages.dart';
import '../../../constants/asset_paths.dart';
import '../../../utils/helpers/local_storage.dart';
import '../../../utils/services/dio/authentication_services/sign_up_service.dart';
import '../mixins/validate_register_form.dart';
import '../models/country_model.dart';
import '../models/sign_up_model.dart';
import '../models/sign_up_success_response_model.dart';

class UpdateProfileController extends GetxController with ValidateRegisterForm {
  final SignUpService signUpService = SignUpService();
  final TextEditingController search = TextEditingController();
  Rx<double> height = 400.0.obs;
   final int baseDuration = 650;
  Rx<String> selectedCountry = "".obs;
  Rx<bool> isSearchListEmpty = true.obs;

  List<CountryModel> searchResult = [];
  List<CountryModel> countries = [
    CountryModel(
      icon: AssetPath.unitedStates,
      name: 'United States',
      abbr: 'US',
    ),
    CountryModel(
      icon: AssetPath.unitedKingdom,
      name: 'United Kingdom',
      abbr: 'UK',
    ),
    CountryModel(
      icon: AssetPath.singapore,
      name: 'Singapore',
      abbr: 'SG',
    ),
    CountryModel(
      icon: AssetPath.china,
      name: 'China',
      abbr: 'CN',
    ),
    CountryModel(
      icon: AssetPath.netherlands,
      name: 'Netherlands',
      abbr: 'NL',
    ),
    CountryModel(
      icon: AssetPath.indonesia,
      name: 'Indonesia',
      abbr: 'ID',
    ),
  ];

  void selectCountry({selectedCountyAbbr, selectedCountyName}) {
    selectedCountry.value = selectedCountyAbbr;
    country.text = selectedCountyName;
    search.text = "";
    validateCountry();

    Get.back();
  }

  Future<void> signUp() async {
    if (isFullNameValidated.value == true &&
        isPasswordValidated.value == true &&
        isCountryValidated.value == true) {
      isLoading.value = true;
      try {
        var res = await signUpService.signUpService(
          signUpModel: SignUpModel(
            fullName: fullName.text,
            username: userName.text,
            country: selectedCountry.value,
            password: password.text,
            email: LocalStorage.getUserEmail(),
            deviceName: 'mobile',
          ),
        );
        if (res.statusCode == 200) {
          // Save response from signInService
          SignUpSuccessResponseModel responseData =
              SignUpSuccessResponseModel.fromJson(res.data);

          // Save access token in Local Storage
          LocalStorage.saveToken(responseData.data!.token!);

          // Save User's full name in Local Storage
          LocalStorage.saveFullName(responseData.data!.user!.fullName!);

          // Navigate to Confirmation screen
          Get.offAllNamed(
            Routes.createPin,
            arguments: [responseData],
          );
          // Stop button loader
          isLoading.value = false;
        } else {
          CustomSnackBar.showSnackBar(
              message: res.data["errors"]["email"][0].toString());
          isLoading.value = false;
        }
      } catch (e) {
        CustomSnackBar.showSnackBar(message: e.toString());
        isLoading.value = false;
      }
    }
  }

  searchCountry({query}) {
    searchResult.clear();
    isSearchListEmpty.value = true;

    if (query.isEmpty) {
      return;
    }

    for (var element in countries) {
      if (element.name.toLowerCase().contains(query) ||
          element.abbr.toLowerCase().contains(query)) {
        searchResult.add(element);
        isSearchListEmpty.value = false;
      }
    }
  }
}
