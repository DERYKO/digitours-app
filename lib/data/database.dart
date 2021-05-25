import 'package:digitours/data/model/auth_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  Box<bool> showOnBoardScreenBoolBox;
  Box<AuthModel> authBox;

  init() async {
    await Hive.initFlutter();
    await initaliseBoxes();
  }

  Future initaliseBoxes() async {
    authBox = await Hive.openBox('authbox');
    showOnBoardScreenBoolBox = await Hive.openBox('showonboardscreenboolbox');
  }
}

DataBase db = DataBase();
