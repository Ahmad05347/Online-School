import 'package:dio/dio.dart';
import 'package:u_learning/common/values/constant.dart';

class HttpUtil {
  static HttpUtil instance = HttpUtil.internal();
  factory HttpUtil() {
    return instance;
  }
  late Dio dio;
  HttpUtil.internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }
  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    print("my response data is ${response.toString()}");
    return response.data;
  }
}
