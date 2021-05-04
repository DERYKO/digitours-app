import 'package:digitours/api/dio.dart';
import 'package:digitours/config.dart';

class Api extends DioApi {
  Api() : super(Config.appUrl);

  Future mobilelogin(String phoneNumber) {
    return dio.post('/login', queryParameters: {'phone': phoneNumber});
  }
}

Api api = Api();
