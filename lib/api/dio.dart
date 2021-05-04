import 'package:digitours/utils/color_error_util.dart';
import 'package:dio/dio.dart';

class DioApi {
  Dio dio;

  DioApi(String apiUrl) {
    dio = Dio();
    dio.options.baseUrl = apiUrl;
    dio.interceptors.add(InterceptorsWrapper(onRequest: _requestIntercept));
    dio.interceptors.add(InterceptorsWrapper(onResponse: _responseIntercept));
    dio.interceptors.add(InterceptorsWrapper(onError: _errorIntercept));
  }

  void _requestIntercept(options) {
    print(
        "REQUEST: ${options?.method}: ${options?.baseUrl}${options?.path} ${options?.queryParameters}");
  }

  void _responseIntercept(options) {
    print(
        "REQUEST: ${options?.method}: ${options?.baseUrl}${options?.path} ${options?.queryParameters}");
  }

  void _errorIntercept(DioError error) {
    printError("${error.request?.path} ${error.response?.data}");
  }
}
