import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List mondayToDo = [];
  List tuesdayToDo = [];
  List wednesdayToDo = [];
  List thursdayToDo = [];
  List fridayToDo = [];
  List saturdayToDo = [];
  List sundayToDo = [];

  final _mybox = Hive.box('mybox');

  int getItemsCount(String day) {
    if (day == "Monday") {
      return mondayToDo.length;
    } else if (day == "Tuesday") {
      return tuesdayToDo.length;
    } else if (day == "Wednesday") {
      return wednesdayToDo.length;
    } else if (day == "Thursday") {
      return thursdayToDo.length;
    } else if (day == "Friday") {
      return fridayToDo.length;
    } else if (day == "Saturday") {
      return saturdayToDo.length;
    } else if (day == "Sunday") {
      return sundayToDo.length;
    }
    return 0;
  }

  String getTaskName(String day, int index) {
    if (day == "Monday") {
      return mondayToDo[index][0];
    } else if (day == "Tuesday") {
      return tuesdayToDo[index][0];
    } else if (day == "Wednesday") {
      return wednesdayToDo[index][0];
    } else if (day == "Thursday") {
      return thursdayToDo[index][0];
    } else if (day == "Friday") {
      return fridayToDo[index][0];
    } else if (day == "Saturday") {
      return saturdayToDo[index][0];
    } else if (day == "Sunday") {
      return sundayToDo[index][0];
    }
    return "";
  }

  bool getTaskCompleted(String day, int index) {
    if (day == "Monday") {
      return mondayToDo[index][1];
    } else if (day == "Tuesday") {
      return tuesdayToDo[index][1];
    } else if (day == "Wednesday") {
      return wednesdayToDo[index][1];
    } else if (day == "Thursday") {
      return thursdayToDo[index][1];
    } else if (day == "Friday") {
      return fridayToDo[index][1];
    } else if (day == "Saturday") {
      return saturdayToDo[index][1];
    } else if (day == "Sunday") {
      return sundayToDo[index][1];
    }
    return false;
  }

  void createInitialData(String Day) {
    if (Day == "Monday") {
      mondayToDo = [];
    } else if (Day == "Tuesday") {
      tuesdayToDo = [];
    } else if (Day == "Wednesday") {
      wednesdayToDo = [];
    } else if (Day == "Thursday") {
      thursdayToDo = [];
    } else if (Day == "Friday") {
      fridayToDo = [];
    } else if (Day == "Saturday") {
      saturdayToDo = [];
    } else if (Day == "Sunday") {
      sundayToDo = [];
    }
  }

  void loadData(String Day) {
    if (Day == "Monday") {
      mondayToDo = _mybox.get('mondayToDo');
    } else if (Day == "Tuesday") {
      tuesdayToDo = _mybox.get('tuesdayToDo');
    } else if (Day == "Wednesday") {
      wednesdayToDo = _mybox.get('wednesdayToDo');
    } else if (Day == "Thursday") {
      thursdayToDo = _mybox.get('thursdayToDo');
    } else if (Day == "Friday") {
      fridayToDo = _mybox.get('fridayToDo');
    } else if (Day == "Saturday") {
      saturdayToDo = _mybox.get('saturdayToDo');
    } else if (Day == "Sunday") {
      sundayToDo = _mybox.get('sundayToDo');
    }
  }

  void updateDataBase(String Day) {
    if (Day == "Monday") {
      _mybox.put('mondayToDo', mondayToDo);
    } else if (Day == "Tuesday") {
      _mybox.put('tuesdayToDo', tuesdayToDo);
    } else if (Day == "Wednesday") {
      _mybox.put('wednesdayToDo', wednesdayToDo);
    } else if (Day == "Thursday") {
      _mybox.put('thursdayToDo', thursdayToDo);
    } else if (Day == "Friday") {
      _mybox.put('fridayToDo', fridayToDo);
    } else if (Day == "Saturday") {
      _mybox.put('saturdayToDo', saturdayToDo);
    } else if (Day == "Sunday") {
      _mybox.put('sundayToDo', sundayToDo);
    }
  }
}
