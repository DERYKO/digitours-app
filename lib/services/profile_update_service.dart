import 'package:digitours/api/api.dart';
import 'package:flutter/cupertino.dart';

class ProfileUpdateService extends ChangeNotifier {
  bool _isUpdatingProfile = false;
  bool get isUpdatingProfile => _isUpdatingProfile;

  set isUpdatingProfile(bool val) {
    _isUpdatingProfile = val;
    notifyListeners();
  }

  Future updateProfile(String name, String email) {
    isUpdatingProfile = true;
    return api.updateProfile(name, email).then((response) {
      var payload = response.data;
      print(payload);
      isUpdatingProfile = false;
    }).catchError((error) {
      print('Error Occured While updating profile $error');
      isUpdatingProfile = false;
    });
  }
}

ProfileUpdateService profileupdateservice = ProfileUpdateService();
