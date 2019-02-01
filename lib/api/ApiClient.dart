import 'package:dio/dio.dart';
import 'dart:io';
import 'Constant.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._init();

  factory ApiClient() => _instance;

  Dio _dio;

  ApiClient._init() {
    if (_dio == null) {
      // 按照默认配置创建 dio 实例
      _dio = Dio(Options(
          baseUrl: SERVER_URL,
          connectTimeout: 5 * 1000,
          receiveTimeout: 10 * 1000,
          headers: {
            "user-agent": "flutter_meizhi",
          },
          contentType: ContentType.json,
          responseType: ResponseType.JSON));
      // 返回拦截器
      _dio.interceptor.response.onSuccess = (Response response) {
        print("ApiClient,response succeed,data ==>>>$response");
        return response;
      };
      _dio.interceptor.response.onError = (DioError e) {
        print("ApiClient,response failed,error ==>>>$e");
        return e;
      };
    }
  }

  static Future<Map<String, dynamic>> get(String path,
      [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response = (params == null)
        ? await _instance._dio.get(path)
        : await _instance._dio.get(path, data: params);
    return response.data;
  }
}
