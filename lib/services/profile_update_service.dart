import 'package:digitours/api/api.dart';
import 'package:digitours/data/database.dart';
import 'package:digitours/data/model/auth_model.dart';
import 'package:digitours/utils/color_error_util.dart';
import 'package:flutter/cupertino.dart';

class ProfileUpdateService extends ChangeNotifier {
  bool _isUpdatingProfile = false;
  bool get isUpdatingProfile => _isUpdatingProfile;

  set isUpdatingProfile(bool val) {
    _isUpdatingProfile = val;
    notifyListeners();
  }

  Future updateProfile(name, email, photo) {
    isUpdatingProfile = true;
    return api.updateProfile(name, email, photo).then((response) {
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

ProfileUpdateService profileupdateservice = ProfileUpdateService();
