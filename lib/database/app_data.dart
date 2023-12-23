import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List listData = [];

  // Create a singleton instance
  static final ToDoDatabase _instance = ToDoDatabase._internal();

  factory ToDoDatabase() {
    return _instance;
  }

  ToDoDatabase._internal();

  // reference our box
  final myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    listData = [];
  }

  // load the data from database
  void loadData() {
    listData = myBox.get("listData") ?? [];
  }

  // update the database
  void updateDataBase() {
    myBox.put("listData", listData);
  }
}
