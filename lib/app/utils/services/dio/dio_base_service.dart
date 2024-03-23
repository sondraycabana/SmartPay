import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import '../../../components/custom_snack_bar.dart';
import '../../helpers/local_storage.dart';
import '../../helpers/logger.dart';

class BaseService {
  String baseUrlTest = "https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1";
  static const Map<String, String> headers = {
    "Accept": "*/*",
    "Content-Type": "application/json",
  };
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1",
      validateStatus: (status) {
        return status! < 500;
      },
      headers: headers,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
    ),
  )..interceptors.add(LoggingInterceptor());

  Future<Response> request(
    String url, {
    dynamic body,
    required String method,
  }) async {
    var token = await LocalStorage.getToken();
    var res = _dio.request(
      url,
      data: body,
      options: Options(
        method: method,
        headers: token != null ? {'authorization': 'Bearer $token'} : null,
      ),
    );
    return res;
  }
}

handleError(DioError error) {
  if (kDebugMode) {
    print(error.response.toString());
  }
  if (error.message!.contains('SocketException')) {
    return CustomSnackBar.showSnackBar(
      message:
          "We cannot detect internet connection. Seems like you are offline.",
    );
  }

  if (error.type == DioErrorType.connectionTimeout) {
    return CustomSnackBar.showSnackBar(
      message: "Connection timed out. Seems like you are offline.",
    );
  }

  if (error.response == null || error.response!.data is String) {
    return CustomSnackBar.showSnackBar(
      message: "Something went wrong. Please try again later",
    );
  }

  return CustomSnackBar.showSnackBar(
      message: "Something went wrong. Please try again later");
}
