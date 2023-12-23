import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_rem/components/dialog_box.dart';
import 'package:todo_rem/components/list_component.dart';
import 'package:todo_rem/database/app_data.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _controller = TextEditingController();

  final myBox = Hive.box('mybox');

  @override
    final ToDoDatabase _toDoDatabase = ToDoDatabase();

  @override
  void initState() {
    if (_toDoDatabase.listData.isEmpty) {
      _toDoDatabase.createInitialData();
    } else {
      _toDoDatabase.loadData();
    }

    super.initState();
  }

  void saveNewTask() {
    setState(() {
      _toDoDatabase.listData.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
    _toDoDatabase.updateDataBase();
  }

  // create a new task
    void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff4B33A9).withOpacity(0.2),
        appBar: AppBar(
          toolbarHeight: 72,
          backgroundColor: Color(0xff4B33A9),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          centerTitle: true,
          title: Text(
            'ToDo List',
            style: GoogleFonts.rubikMaze(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
                color: Color.fromARGB(255, 215, 214, 214)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          backgroundColor: Color(0xff4B33A9),
          child: Icon(
            Icons.add,
            color: Color(0xffBABABA),
            size: 28,
          ),
        ),
        body: ListView.builder(
            itemCount: ToDoDatabase().listData.length,
            itemBuilder: (context, index) {
              return ListComponent(toDoTask: ToDoDatabase().listData[index]);
            }),
      ),
    );
  }
}
