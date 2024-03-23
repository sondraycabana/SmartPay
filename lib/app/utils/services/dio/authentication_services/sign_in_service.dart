import 'package:dio/dio.dart';
import '../dio_base_service.dart';

class SignInService {
  final BaseService _service = BaseService();

  Future<Response> signInService({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    Map<String, String> body = {
      "email": email,
      "password": password,
      "device_name": deviceName,
    };
    String suffixUrl = "/auth/login";
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
