import 'dart:io';

import 'package:digitours/api/dio.dart';
import 'package:dio/dio.dart';

import 'package:digitours/config.dart';

class Api extends DioApi {
  Api() : super(Config.appUrl);

  Future mobilelogin(String phoneNumber) {
    return dio.post('/login', queryParameters: {'phone': phoneNumber});
  }

  Future verifyPhone(String phoneNumber, String code) {
    return dio
        .post('/code', queryParameters: {'code': code, 'phone': phoneNumber});
  }

  Future updateProfile(
    String name,
    String email,
    File photo,
  ) {
    return dio.post('/user',
        data: FormData.fromMap({"name": name, "email": email, 'photo': photo}));
  }

  Future getTravelDestinations() {
    return dio.get('/travel-destination');
  }

  Future getActivities() {
    return dio.get('/activity');
  }
}

Api api = Api();
