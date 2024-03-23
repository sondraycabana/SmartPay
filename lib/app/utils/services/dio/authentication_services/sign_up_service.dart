import 'package:dio/dio.dart';
import '../../../../modules/update_profile/models/sign_up_model.dart';
import '../dio_base_service.dart';

class SignUpService {
  final BaseService _service = BaseService();

  Future<Response> signUpService({
    required SignUpModel signUpModel,
  }) async {
    Map<String, dynamic> body = signUpModel.toJson();
    String suffixUrl = "/auth/register";
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
