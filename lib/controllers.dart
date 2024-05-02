import 'package:assignment/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var items = <Items>[].obs;
  final TextEditingController textController = TextEditingController();

  void addItem() {
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      items.add(Items(text: text));
      textController.clear();
    }
  }

  void toggleItem(int index) {
    items[index].completed = !items[index].completed;
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}

