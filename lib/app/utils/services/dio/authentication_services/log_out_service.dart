import 'package:dio/dio.dart';

import '../../../helpers/local_storage.dart';
import '../dio_base_service.dart';

class LogOutService {
  final BaseService _service = BaseService();

  Future<Response> logOutService() async {
    Map<String, String> body = {
      "token": LocalStorage.getToken(),
    };
    String suffixUrl = "/auth/logout";
    String methodType = "Post";
    try {
      Response response = await _service.request(
        suffixUrl,
        method: methodType,
        body: body,
      );
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
