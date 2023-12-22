import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List listData = [];

  // reference our box
  final myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    listData = [
      "Make Tutorial",
      "Do Exercise",
    ];
  }

  // load the data from database
  void loadData() {
    listData = myBox.get("listData");
  }

  // update the database
  void updateDataBase() {
    myBox.put("listData", listData);
  }
}