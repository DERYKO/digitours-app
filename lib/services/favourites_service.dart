import 'package:digitours/data/database.dart';
import 'package:flutter/cupertino.dart';

class FavouriteService extends ChangeNotifier {
  void setFavourite(int destId) {
    db.favouritedestidsBox.add(destId);
    print("${db.favouritedestidsBox.values}");
  }

  bool isFavourite(destId) {
    return db.favouritedestidsBox.values.contains(destId);
  }

  void removeFavourite(destId) {
    var indexOfFav = db.favouritedestidsBox.values.toList().indexOf(destId);
    db.favouritedestidsBox.deleteAt(indexOfFav);
  }
}

FavouriteService favouriteService = FavouriteService();
