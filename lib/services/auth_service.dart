import 'package:digitours/api/api.dart';
import 'package:digitours/data/database.dart';
import 'package:digitours/data/model/auth_model.dart';
import 'package:digitours/utils/color_error_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  bool get showOnboardScreens =>
      db.appSettingsBools.get('showonboardscreens', defaultValue: true);
  AuthModel get authUser => db.authBox.get('user');

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
    _verifyingPhoneNumber = false;
    notifyListeners();
  }

  Future verifyPhoneNumber(String phoneNumber, String code) {
    verifyingPhoneNumber = true;
    return api.verifyPhone(phoneNumber, code).then((response) {
      var payload = response.data;
      verifyingPhoneNumber = false;
      return payload;
    }).catchError((error) {
      verifyingPhoneNumber = false;
      print('ERROR OCCURED WHILE VERIFYING PHONE NUMBER');
    });
  }

  bool _isUpdatingProfile = false;
  bool get isUpdatingProfile => _isUpdatingProfile;

  set isUpdatingProfile(bool val) {
    _isUpdatingProfile = val;
    notifyListeners();
  }

  Future updateProfile(name, email) {
    isUpdatingProfile = true;
    return api.updateProfile(name, email).then((response) {
      var payload = response.data;
      _saveUserData(payload['user']);
      return payload;
    }).catchError((error) {
      printError("ERROR OCCURED WHILE UPDATING USER PROFILE $error");
      isUpdatingProfile = false;
    });
  }

  void _saveUserData(userdata) {
    db.authBox.put('user', AuthModel.fromMap(userdata));
    isUpdatingProfile = false;
  }
}

AuthService authservice = AuthService();
