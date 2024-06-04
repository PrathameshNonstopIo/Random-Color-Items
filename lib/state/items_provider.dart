import 'package:first_app/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemsProvider extends ChangeNotifier {
  List<ItemModel> items = [];

  void addItem(ItemModel newItem) {
    items.add(newItem);
    notifyListeners();
  }

  void changeColor(List<Color> color) {
    for(int i = 0; i < items.length; i++) {
      items[i].itemColor = color[i];
    }
    notifyListeners();
  }

}