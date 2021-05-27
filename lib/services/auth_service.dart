import 'package:digitours/api/api.dart';
import 'package:digitours/data/database.dart';
import 'package:digitours/data/model/auth_model.dart';
import 'package:digitours/utils/color_error_util.dart';

import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  bool get showOnboardScreens =>
      db.appSettingsBools.get('showonboardscreens', defaultValue: true);

  AuthModel get authUser => db.authBox.get('user');
  String get accesstoken => db.accessTokenBox.get('accesstoken');

  bool _postingMobileLogin = false;
  bool get postingMobileLogin => _postingMobileLogin;
  String sentPhoneNumber;

  set postingMobileLogin(bool val) {
    _postingMobileLogin = val;
    notifyListeners();
  }

  Future mobileLogin(String phoneNumber) {
    postingMobileLogin = true;
    sentPhoneNumber = phoneNumber;

    return api.mobilelogin(phoneNumber).then((response) {
      var payload = response.data;

      print(payload);
      postingMobileLogin = false;
      return payload;
    }).catchError((error) {
      postingMobileLogin = false;
      printError('Error occured while confirming login phone number $error');
    });
  }

  bool _verifyingPhoneNumber = false;
  bool get verifyingPhoneNumber => _verifyingPhoneNumber;

  set verifyingPhoneNumber(bool val) {
    _verifyingPhoneNumber = val;
    notifyListeners();
  }

  Future verifyPhoneNumber(String phoneNumber, String code) {
    verifyingPhoneNumber = true;
    return api.verifyPhone(phoneNumber, code).then((response) {
      var payload = response.data;
      _saveAccessToken(payload['token']);
      return payload;
    }).catchError((error) {
      verifyingPhoneNumber = false;
      print('ERROR OCCURED WHILE VERIFYING PHONE NUMBER');
    });
  }

  void _saveAccessToken(String token) {
    db.accessTokenBox.put('accesstoken', token);
    db.appSettingsBools.put("showonboardscreens", false);
    verifyingPhoneNumber = false;
  }
}

AuthService authservice = AuthService();
