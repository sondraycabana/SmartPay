import 'package:dio/dio.dart';
import '../dio_base_service.dart';

class VerifyEmailTokenService {
  final BaseService _service = BaseService();

  Future<Response> verifyEmailTokenService({
    required String email,
    required String token,
  }) async {
    Map<String, String> body = {
      "email": email,
      "token": token,
    };
    String suffixUrl = "/auth/email/verify";
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
