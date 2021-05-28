import 'package:digitours/api/api.dart';
import 'package:digitours/data/model/activities_model.dart';
import 'package:digitours/utils/color_error_util.dart';
import 'package:flutter/cupertino.dart';

class ActivityService extends ChangeNotifier {
  bool _isGettingActivity = false;
  bool get isGettingActivity => _isGettingActivity;

  set isGettingActivity(bool val) {
    _isGettingActivity = val;
    notifyListeners();
  }

  List<ActivityModel> activites = [];
  Future loadActivities() {
    isGettingActivity = true;
    activites = [];
    return api.getActivities().then((response) {
      var payload = response.data;
      _saveActivities(payload);
    }).catchError((error) {
      printError('ERROR OCCURED WHILE LOADING ACTIVTIES $error');
    });
  }

  void _saveActivities(payload) {
    payload.forEach((activity) {
      activites.add(ActivityModel.fromMap(activity));
    });
    _isGettingActivity = false;
  }
}

ActivityService activityservice = ActivityService();
