import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/model/database.dart';
import 'package:todoapp/popUpWindow/dialogBox.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDo extends StatefulWidget {
  final String Day;
  final String dayImage;
  const toDo({super.key, required this.Day, required this.dayImage});

  @override
  State<toDo> createState() => _toDoState();
}

class _toDoState extends State<toDo> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  final todoBox = {
    "Monday": "mondayToDo",
    "Tuesday": "tuesdayToDo",
    "Wednesday": "wednesdayToDo",
    "Thursday": "thursdayToDo",
    "Friday": "fridayToDo",
    "Saturday": "saturdayToDo",
    "Sunday": "sundayToDo",
  };

  @override
  void initState() {
    if (_myBox.get(todoBox[widget.Day]) == null) {
      db.createInitialData(widget.Day);
    } else {
      db.loadData(widget.Day);
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index, String Day) {
    if (Day == "Monday") {
      setState(() {
        db.mondayToDo[index][1] = !db.mondayToDo[index][1];
      });
    } else if (Day == "Tuesday") {
      setState(() {
        db.tuesdayToDo[index][1] = !db.tuesdayToDo[index][1];
      });
    } else if (Day == "Wednesday") {
      setState(() {
        db.wednesdayToDo[index][1] = !db.wednesdayToDo[index][1];
      });
    } else if (Day == "Thursday") {
      setState(() {
        db.thursdayToDo[index][1] = !db.thursdayToDo[index][1];
      });
    } else if (Day == "Friday") {
      setState(() {
        db.fridayToDo[index][1] = !db.fridayToDo[index][1];
      });
    } else if (Day == "Saturday") {
      setState(() {
        db.saturdayToDo[index][1] = !db.saturdayToDo[index][1];
      });
    } else if (Day == "Sunday") {
      setState(() {
        db.sundayToDo[index][1] = !db.sundayToDo[index][1];
      });
    }
    db.updateDataBase(Day);
  }

  void saveNewTask(String Day) {
    if (Day == "Monday") {
      setState(() {
        db.mondayToDo.add([_controller.text, false]);
        _controller.clear();
      });
    } else if (Day == "Tuesday") {
      setState(() {
        db.tuesdayToDo.add([_controller.text, false]);
        _controller.clear();
      });
    } else if (Day == "Wednesday") {
      setState(() {
        db.wednesdayToDo.add([_controller.text, false]);
        _controller.clear();
      });
    } else if (Day == "Thursday") {
      setState(() {
        db.thursdayToDo.add([_controller.text, false]);
        _controller.clear();
      });
    } else if (Day == "Friday") {
      setState(() {
        db.fridayToDo.add([_controller.text, false]);
        _controller.clear();
      });
    } else if (Day == "Saturday") {
      setState(() {
        db.saturdayToDo.add([_controller.text, false]);
        _controller.clear();
      });
    } else if (Day == "Sunday") {
      setState(() {
        db.sundayToDo.add([_controller.text, false]);
        _controller.clear();
      });
    }

    Navigator.of(context).pop();
    db.updateDataBase(Day);
  }

  void createNewTask(String Day) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            saveNewTask(Day);
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index, String Day) {
    if (Day == "Monday") {
      setState(() {
        db.mondayToDo.removeAt(index);
      });
    } else if (Day == "Tuesday") {
      setState(() {
        db.tuesdayToDo.removeAt(index);
      });
    } else if (Day == "Wednesday") {
      setState(() {
        db.wednesdayToDo.removeAt(index);
      });
    } else if (Day == "Thursday") {
      setState(() {
        db.thursdayToDo.removeAt(index);
      });
    } else if (Day == "Friday") {
      setState(() {
        db.fridayToDo.removeAt(index);
      });
    } else if (Day == "Saturday") {
      setState(() {
        db.saturdayToDo.removeAt(index);
      });
    } else if (Day == "Sunday") {
      setState(() {
        db.sundayToDo.removeAt(index);
      });
    }
    db.updateDataBase(Day);
  }

  @override
  Widget build(BuildContext context) {
    final dayToMessage = {
      "Monday": "What Will You Do on this Monday?",
      "Tuesday": "What Will You Do on this Tuesday?",
      "Wednesday": "What Will You Do on this Wednesday?",
      "Thursday": "What Will You Do on this Thursday?",
      "Friday": "What Will You Do on this Friday?",
      "Saturday": "What Will You Do on this Saturday?",
      "Sunday": "What Will You Do on this Sunday?",
    };

    String textMessage =
        dayToMessage[widget.Day] ?? "What Will You Do on this Day?";
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 143, 177, 1),
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              widget.Day,
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            SizedBox(
              width: 2,
            ),
            Image.asset(widget.dayImage,
                width: 25, height: 25, fit: BoxFit.fill)
          ],
        ),
        backgroundColor: Colors.pink[300],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Text(
                  textMessage,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: db.getItemsCount(widget.Day),
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db.getTaskName(widget.Day, index),
                            taskCompleted:
                                db.getTaskCompleted(widget.Day, index),
                            onChanged: (value) =>
                                checkBoxChanged(value, index, widget.Day),
                            deleteFunction: (context) =>
                                deleteTask(index, widget.Day),
                          );
                        }))
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.pink[400],
              onPressed: () {
                createNewTask(widget.Day);
              },
              child: Icon(
                Icons.add_rounded,
                size: 50,
                color: Colors.pink[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          width: double.infinity,
          height: 80,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.pink[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.5),
                ),
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                fillColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors
                        .white; // Warna latar belakang saat checkbox dicentang
                  }
                  return Colors
                      .transparent; // Warna latar belakang saat checkbox belum dicentang
                }),
              ),

              // task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
