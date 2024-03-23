import 'package:dio/dio.dart';
import '../dio_base_service.dart';

class GetEmailTokenService {
  final BaseService _service = BaseService();

  Future<Response> getEmailTokenService({required String email}) async {
    Map<String, String> body = {"email": email};
    String suffixUrl = "/auth/email";
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
