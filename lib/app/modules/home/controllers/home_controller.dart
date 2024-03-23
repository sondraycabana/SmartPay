import 'package:get/get.dart';


import '../../../components/custom_snack_bar.dart';
import '../../../utils/services/dio/dashboard_services/home_service.dart';
import '../models/home_success_response_model.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final HomeService homeService = HomeService();

  Future<HomeSuccessResponseModel?> getHomeSecret() async {
    try {
      var res = await homeService.homeService();
      if (res.statusCode == 200) {
        HomeSuccessResponseModel homeData =
            HomeSuccessResponseModel.fromJson(res.data);
        return homeData;
      } else {
        CustomSnackBar.showSnackBar(message: res.data["message"].toString());
      }
    } catch (e) {
      CustomSnackBar.showSnackBar(message: e.toString());
    }
    return null;
  }


}
