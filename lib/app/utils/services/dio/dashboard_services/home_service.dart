import 'package:dio/dio.dart';
import '../dio_base_service.dart';

class HomeService {
  final BaseService _service = BaseService();

  Future<Response> homeService() async {
    String suffixUrl = "/dashboard";
    String methodType = "Get";
    try {
      Response response = await _service.request(
        suffixUrl,
        method: methodType,
      );
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
