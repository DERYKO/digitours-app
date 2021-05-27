import 'package:digitours/api/api.dart';
import 'package:digitours/data/model/travel_destinations_model.dart';
import 'package:flutter/cupertino.dart';

class TravelDestinationsService extends ChangeNotifier {
  bool _isGettingTravelDest = false;
  bool get isGettingTravelDest => _isGettingTravelDest;

  set isGettingTravelDest(bool val) {
    _isGettingTravelDest = val;
    notifyListeners();
  }

  List<TravelDestinationModel> traveldestinations = [];
  Future loadTravelDestinations() {
    traveldestinations = [];
    isGettingTravelDest = true;
    return api.getTravelDestinations().then((response) {
      var payload = response.data;
      _saveTravelDestinations(payload);
      return payload;
    }).catchError((error) {
      print('ERROR OCCURED WHILE LOADING TRAVEL DESTINATINONS $error');
      isGettingTravelDest = false;
    });
  }

  void _saveTravelDestinations(payload) {
    payload.forEach((traveldest) {
      traveldestinations.add(TravelDestinationModel.fromMap(traveldest));
    });
    isGettingTravelDest = false;
  }
}

TravelDestinationsService travelDestinationsService =
    TravelDestinationsService();
