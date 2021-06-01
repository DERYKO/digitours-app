import 'package:digitours/data/model/auth_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  Box<bool> appSettingsBools;
  Box<AuthModel> authBox;
  Box accessTokenBox;
  Box favouritedestidsBox;

  init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _initaliseBoxes();
  }

  Future _initaliseBoxes() async {
    authBox = await Hive.openBox('authbox');
    appSettingsBools = await Hive.openBox('appsettingsbools');
    accessTokenBox = await Hive.openBox('accesstokenbox');
    favouritedestidsBox = await Hive.openBox("favouritedestidsBox");
  }

  void _registerAdapters() {
    Hive.registerAdapter<AuthModel>(AuthModelAdapter());
  }
}

DataBase db = DataBase();
